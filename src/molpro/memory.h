#ifndef MOLPRO_MEMORY_H
#define MOLPRO_MEMORY_H
#include <cstddef>
#include <cstdint>
#include <sstream>
#include <iostream>
#include <limits>
#include <string>
#include <unordered_map>
#include <new>
#include <vector>
#include <array>
#include <stdexcept>
#include <cassert> // assumed that NDEBUG is set properly for optimised compilation
#include <iostream>
#include <iterator>
#include <algorithm>
#include <initializer_list>
#ifdef __cplusplus
#include <climits>
#endif
#include <limits>
#include <molpro/memory/memory-config.h>

#ifdef MOLPRO_MEMORY_FORTRAN
extern "C" {
/*!
 * \brief Initialize the memory system
 * \param buffer The pre-allocated memory buffer for the stack
 * \param n The number of bytes to be reserved for the stack
 */
void memory_initialize(char *buffer, size_t n);
/*!
 * \brief Create a new array on the stack
 * \param n The number of bytes to allocate
 * \return pointer to the created array
 */
double* memory_allocate(size_t n);
/*!
 * \brief Release the memory allocated to a given pointer.
 * \param p The pointer to be released.
 * \param all
 * If non-zero, the top of the stack is reset to be just below
 * the given pointer, thereby releasing memory allocated to other
 * pointers allocated later than the given one.
 */
void memory_release(char* p, int all = 1);
/*!
 * \brief Take an existing allocated pointer, and reallocate it, retaining any existing data that is within the new bounds.
 * If the existing pointer is on the heap, the old array will be released.
 * If the existing pointer is at the top of the stack, it will be adjusted in size without any copying of data,
 * provided that the lower bound is not changed too.
 * Similarly, if the existing pointer is on the stack and it is being reduced in size without a change in lower bound,
 * the existing storage will be reused without copying, and without releasing the unused memory.
 * \param p
 * \param n The new size in bytes.
 */
void memory_resize(char** p, size_t n);
/*!
 * \brief memory_save Remember the state of the stack, with a view
 * to coming back to it via a call to \c memory_release_saved
 * \return
 */
size_t memory_save();
/*!
 * \brief memory_release_saved Release all stack memory allocated
 * since call to \ref memory_save
 * \param p The handle returned by a previous \ref memory_save
 */
void memory_release_saved(size_t p);
/*!
 * \brief memory_used Report used memory
 * \param maximum if true (default is false), report the maximum
 * memory allocated to date, in bytes.
 * \return
 */
size_t memory_used(int maximum);
/*!
 * \brief memory_remaining Report used memory
 * \return remaining memory in bytes
 */
size_t memory_remaining();
/*!
 * \brief memory_print_status Print the state of the memory
 */
void memory_print_status();
/*!
 * \brief memory_reset_maximum_stack  Reset the maximum stack used
 * statistic to the currently-used stack
 * \param level if non-negative, the stack position desired; default is
 * current stack size in bytes
 */
void memory_reset_maximum_stack(int64_t level);

void memory_module_test_fortran(int printlevel);

}

#else // MOLPRO_MEMORY_FORTRAN
extern size_t _private_memory_used;
extern size_t _private_memory_maximum_allocatable;
extern std::unordered_map<char*, size_t> _private_memory_lengths;

inline size_t memory_initialize(char *buffer, size_t max) {
  return (_private_memory_maximum_allocatable = max);
} // more checks
/*!
 * \brief memory_used Report used memory
 * \param maximum if true (default is false), report the maximum
 * memory allocated to date, in bytes.
 * \return
 */
inline size_t memory_used(int maximum = 0) { return _private_memory_used; }
/*!
 * \brief memory_remaining Report used memory
 * \return remaining memory in bytes
 */
inline size_t memory_remaining() { return _private_memory_maximum_allocatable - _private_memory_used; }
/*!
 * \brief memory_print_status Print the state of the memory
 */
inline void memory_print_status() {
  std::cout << "Memory used: " << memory_used() << std::endl;
  std::cout << "Memory remaining: " << memory_remaining() << std::endl;
}
/*!
 * \brief memory_reset_maximum_stack  Reset the maximum stack used
 * statistic to the currently-used stack
 * \param level if non-negative, the stack position desired; default is
 * current stack size in bytes
 */
inline void memory_reset_maximum_stack(int64_t level) {

}
#endif // MOLPRO_MEMORY_FORTRAN

namespace molpro {
/*!
   * An allocator suitable for use with STL, that monitors usage
   * If the symbol MOLPRO_MEMORY_FORTRAN is defined, allocation is outsourced to the
   * fortran memory allocator, otherwise it is done with malloc().
   */
template<typename T, typename A = std::allocator<T> >
class allocator_ : public A {
  using a_t = std::allocator_traits<A>;
 public :
//  using A::A;
  typedef T value_type;
  typedef value_type* pointer;
  typedef const value_type* const_pointer;
  typedef value_type& reference;
  typedef const value_type& const_reference;
  typedef std::size_t size_type;
  typedef std::ptrdiff_t difference_type;

 public :
  template<typename U>
  struct rebind {
    typedef allocator_<U, typename a_t::template rebind_alloc<U> > other;
  };

 public :

  pointer address(reference r) { return &r; }
  const_pointer address(const_reference r) const { return &r; }

#ifndef NOALLOCATE
  pointer allocate(size_type cnt, typename std::allocator<void>::const_pointer = nullptr) {
#ifdef MOLPRO_MEMORY_FORTRAN
    if (memory_remaining() < cnt * sizeof(T))
#else
      //    std::cout << "hello from allocate" << std::endl;
          if (_private_memory_maximum_allocatable == 0) _private_memory_maximum_allocatable = memory_initialize(nullptr, std::numeric_limits<size_t>::max());
          if ((_private_memory_maximum_allocatable - _private_memory_used) < (cnt * sizeof(T)))
#endif
      throw std::runtime_error(std::string("molpro::allocate: insufficient remaining stack memory; remaining=")
                                   + std::to_string(static_cast<unsigned long long>(memory_remaining()))
                                   + std::string(", requested=")
                                   + std::to_string(static_cast<unsigned long long>(cnt * sizeof(T))));
#ifdef MOLPRO_MEMORY_FORTRAN
    return reinterpret_cast<pointer>(memory_allocate(cnt * sizeof(T)));
#else
    _private_memory_used += cnt * sizeof(T);
//    std::cout << "incrementing used by " << cnt * sizeof(T) << " to " << _private_memory_used << std::endl;
#ifdef MEMORY_MALLOC
    auto result = reinterpret_cast<pointer>( malloc(cnt * sizeof (T)));
#else
    void* pp = ::operator new[](cnt * sizeof(T));
    auto result = reinterpret_cast<pointer>( pp);
#endif
    _private_memory_lengths[reinterpret_cast<char*>(result)] = cnt * sizeof(T);
    return result;
#endif
  }

  void deallocate(pointer p, size_type) {
#ifdef MOLPRO_MEMORY_FORTRAN
    memory_release((char*) p, 0);
#else
    _private_memory_used -= _private_memory_lengths[reinterpret_cast<char*>(p)];
//    std::cout << "decrementing used to " << _private_memory_used << std::endl;
    _private_memory_lengths.erase(reinterpret_cast<char*>(p));
#ifdef MEMORY_MALLOC
    free(reinterpret_cast<char*>(p));
#else
    delete[] reinterpret_cast<char*>(p);
#endif
#endif
  }
#endif

  size_type max_size() const {
    return std::numeric_limits<size_type>::max();
  }

//    void construct(pointer p, const T& t) { new(p) T(t); }
//    void destroy(pointer p) { p->~T(); }
  template<typename U>
  void construct(U* ptr)
  noexcept(std::is_nothrow_default_constructible<U>::value) {
    ::new(static_cast<void*>(ptr)) U; // no initialisation
  }
  template<typename U, typename...Args>
  void construct(U* ptr, Args&& ... args) {
    a_t::construct(static_cast<A&>(*this),
                   ptr, std::forward<Args>(args)...);
  }

  bool operator==(allocator_ const&) { return true; }
  bool operator!=(allocator_ const& a) { return !operator==(a); }
};
template<typename T>
using allocator = allocator_<T, std::allocator<T> >;
}

namespace molpro {

template<typename T=double, typename A=molpro::allocator<T> >
using stdvector = std::vector<T, A>;

/*!
 * @brief A template for a container class like std::vector<T> but with the following features.
 *
 * - the default allocator is molpro::allocator<T> which uses a managed stack.
 * One should use resize() and reserve() with care, bearing in mind that memory allocation
 * is from a stack. So if the array being resized is not at the top of the stack, and the
 * resize causes it to grow, then it will be moved.
 * - The class is inheritable.
 * - A string representation function is provided for easy printing
 *
 * Because the underlying implementation is std::vector<T>, then all elements of the array are
 * constructed when constructing the array, leading to a construction time that is linear in
 * the array size.
 *
 * \tparam T Type of the elements of the array.
 * \tparam _Alloc Allocator for T
 *
 * Example:
 * \code
 * #include "memory.h"
 * int main() {
 * molpro::memory_initialize(40); // bytes
 * {
 *   molpro::vector<> arr(5);
 *   for (size_t i=0; i<arr.size(); i++) arr[i]=100*i;
 *   for (molpro::vector<>::iterator el=arr.begin(); el!=arr.end(); el++)
 *     std::cout << "array element "<<*el<<std::endl;
 * } // arr will release its buffer and be destroyed on going out of scope
 * return 0; }
 * \endcode
 */
template<typename T=double, typename _Alloc=molpro::allocator<T>>
class vector {
/* The _Alloc template argument is provided to let molpro::vector have
   the same signature as std::vector. They must have same signature if you
   want a templated container (ie allowing use of std::vector OR molpro::vector)
   when using ifort15. See bug 5299.
*/
 private:
  std::vector<T, _Alloc> m_stdvector; // managed buffer
  T* m_buffer; // pointer to the buffer TODO maybe not needed

 public:
//  vector<T, _Alloc>() : m_stdvector(), m_buffer(m_stdvector.data()) { }
  /*!
   * \brief Construct a vector of type T with managed storage.
   * \param length The number of elements of buffer.
   */
  vector<T, _Alloc>(size_t const length = 0)
      : m_stdvector(length), m_buffer(m_stdvector.data()) {}

/*!
 * \brief Construct a vector of type T with managed storage.
 * \param length The number of elements of buffer.
 * \param value The value to assign to all elements of the buffer.
 */
  vector<T, _Alloc>(size_t const length, const T& value)
      : m_stdvector(length, value), m_buffer(m_stdvector.data()) {}

/*!
 * \brief Construct a vector of type T with managed storage.
 * \param first Starting iterator of vector to copy
 * \param last Ending iterator of vector to copy
 */
  template<class InputIterator>
  vector<T, _Alloc>(InputIterator first, InputIterator last)
      : m_stdvector(first, last), m_buffer(m_stdvector.data()) {}

/*!
 * \brief Construct a vector of type T with managed storage.
 * \param il Initializer list
 */
  vector<T, _Alloc>(std::initializer_list<T> il) : m_stdvector(il), m_buffer(m_stdvector.data()) {}

/*!
 * \brief vector<T> Copy constructor
 * \param source An existing object. An element-by-element copy is made, i.e. the data buffer is allocated then copied from source.
 */
  vector<T, _Alloc>(const vector<T, _Alloc>& source) {
    m_stdvector.insert(m_stdvector.begin(), source.begin(), source.end());
    m_buffer = m_stdvector.data();
  }

/*!
 * \brief Copy assignment operator
 */
  vector<T, _Alloc>& operator=(const vector<T, _Alloc>& copy) {
    if (&copy == this) return *this;
    resize(copy.size());
    std::copy(copy.begin(), copy.end(), this->begin());
    return *this;
  }

  virtual ~vector() = default;

  T& operator[](size_t n) {
    return m_stdvector[n];
  }
  const T& operator[](size_t n) const {
    return m_stdvector[n];
  }
/*!
 * \brief Assign new contents to the vector, replacing its current contents
 * \param first Starting iterator of vector to copy
 * \param last Ending iterator of vector to copy
 */
  template<class InputIterator>
  void assign(InputIterator first, InputIterator last) {
    if (last - first != m_stdvector.size()) resize(last - first);
    std::copy(first, last, begin());
  }
/*!
 * \brief Assign new contents to the vector, replacing its current contents
 * \param value The value to set all elements of the vector to.
 */
  void assign(const T& value) {
    std::fill(begin(), end(), value);
  }
/*!
 * \brief Assign new contents to the vector, replacing its current contents
 * \param n The new number of elements
 * \param value The value to set all elements of the vector to.
 */
  void assign(size_t n, const T& value) {
    m_stdvector.assign(n, value);
  }
/*!
 * \brief Assign new contents to the vector, replacing its current contents
 * \param il An initializer. The vector is resized to match the length of il.
 */
  void assign(std::initializer_list<T> il) {
    m_stdvector.assign(il);
  }

  T& at(size_t n) {
    return m_stdvector.at(n);
  }

  const T& at(size_t n) const {
    return m_stdvector.at(n);
  }

  T& back() noexcept {
    return m_stdvector.back();
  }

  const T& back() const noexcept {
    return m_stdvector.back();
  }

  size_t capacity() const noexcept {
    return m_stdvector.capacity();
  }

  void clear() noexcept {
    m_stdvector.clear();
  }

  bool empty() const noexcept {
    return m_stdvector.empty();
  }

  T& front() noexcept {
    return m_stdvector.front();
  }

  const T& front() const noexcept {
    return m_stdvector.front();
  }

  T* data() noexcept { return &front(); }
  const T* data() const noexcept { return &front(); }

  size_t max_size() const noexcept {
    return m_stdvector.max_size();
  }

  size_t size() const noexcept {
    return m_stdvector.size();
  }

/*!
 * \brief Exchange the content of the container by the content of x, which is another object of the same type.
 * \param x Another vector of the same type.
 */
  void swap(vector<T, _Alloc>& x) { swap(*this, x); }

  friend void swap(vector<T, _Alloc>& a, vector<T, _Alloc>& b) {
    std::swap(a.m_stdvector, b.m_stdvector);
  }

  template <bool IsConst>
  class MyIterator {
  public:
    using iterator_category = std::forward_iterator_tag;
    using value_type = T;
    using difference_type = std::ptrdiff_t;
    using pointer = T*;
    using reference = T&;
    MyIterator() noexcept : m_ptr(nullptr) {}
    MyIterator(pointer ptr) : m_ptr(ptr) {}
    MyIterator(const MyIterator&) = default;
    template<bool IsConst_ = IsConst, class = std::enable_if_t<IsConst_>>
    MyIterator(const MyIterator<false>& rhs) : m_ptr(rhs.m_ptr) {}

    reference operator*() const noexcept { return *m_ptr; }
    pointer operator->() const noexcept { return m_ptr; }
    MyIterator& operator++() {m_ptr++; return *this; }
    MyIterator operator++(int) {MyIterator tmp = *this; ++(*this); return tmp; }
    MyIterator& operator--() {m_ptr--; return *this; }
    MyIterator operator--(int) {MyIterator tmp = *this; --(*this); return tmp; }
    friend bool operator==(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr == rhs.m_ptr;}
    friend bool operator!=(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr != rhs.m_ptr;}
    friend bool operator<(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr < rhs.m_ptr;}
    friend bool operator>(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr > rhs.m_ptr;}
    friend bool operator<=(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr <= rhs.m_ptr;}
    friend bool operator>=(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr >= rhs.m_ptr;}
    friend class MyIterator<true>;
    friend class MyIterator<false>;
  private:
    pointer m_ptr;
  };

  using Iterator = MyIterator<false>;
  using ConstIterator = MyIterator<true>;

  typedef Iterator iterator;
  typedef ConstIterator const_iterator;

  iterator begin() noexcept { return iterator(m_buffer); }
  const_iterator begin() const noexcept { return cbegin(); }
  const_iterator cbegin() const noexcept { return const_iterator(m_buffer); }

  iterator end() noexcept { return m_buffer + size(); }
  const_iterator end() const noexcept { return cend(); }
  const_iterator cend() const noexcept { return const_iterator(m_buffer + size()); }

  using reverse_iterator = std::reverse_iterator<Iterator>;
  using const_reverse_iterator = std::reverse_iterator<ConstIterator>;
  reverse_iterator rbegin() noexcept { return reverse_iterator(end()); }
  const_reverse_iterator rbegin() const noexcept { return const_reverse_iterator(end()); }
  const_reverse_iterator crbegin() const noexcept { return const_reverse_iterator(cend()); }
  reverse_iterator rend() noexcept { return reverse_iterator(begin()); }
  const_reverse_iterator rend() const noexcept { return const_reverse_iterator(begin()); }
  const_reverse_iterator crend() const noexcept { return const_reverse_iterator(cend()); }

  iterator erase(const_iterator pos) {
    return &(*m_stdvector.erase(m_stdvector.begin() + (pos.m_ptr - data())));
  }

  iterator erase(const_iterator first, const_iterator last) {
    return &(*m_stdvector.erase(m_stdvector.begin() + (first.m_ptr - data()),
                                m_stdvector.begin() + (last.m_ptr - data())));
  }

/*!
 * \brief Generate a printable representation of the object
 * \param verbosity If zero, express only the length of the object; otherwise, its elements.
 * \param columns If given, a line wrap will be generated every columns values.
 * \return
 */
  std::string str(int verbosity = 1, unsigned int columns = UINT_MAX) const {
    std::ostringstream s;
    if (verbosity == 0)
      s << size();
    else if (verbosity > 0) {
      for (size_t i = 0; i < size(); i++) {
        if (i > 0) {
          if (i % columns)
            s << " ";
          else
            s << std::endl;
        }
        s << at(i);
      }
    }
    return s.str();
  }

  void reserve(size_t new_cap) {
    m_stdvector.reserve(new_cap);
    m_buffer = m_stdvector.data();
  }

/*!
 * \brief Resize the buffer.
 * \param n New length in bytes.
 */
  void resize(size_t n) {
    m_stdvector.resize(n);
    m_buffer = m_stdvector.data();
  }

/*!
 * \brief Resize the buffer, and assign a value to any new elements if it grows.
 * \param n New length in bytes.
 * \param val Value to assign to new elements.
 */
  void resize(size_t n, const T& val) {
    m_stdvector.resize(n, val);
    m_buffer = m_stdvector.data();
  }

  void shrink_to_fit() {
    m_stdvector.shrink_to_fit();
    m_buffer = m_stdvector.data();
  }

  void pop_back() {
    m_stdvector.pop_back();
  }

  void push_back(const T& value) {
    m_stdvector.push_back(value);
    m_buffer = m_stdvector.data();
  }

  void push_back(T&& value) {
    m_stdvector.push_back(std::forward<T>(value));
    m_buffer = m_stdvector.data();
  }

  template<class... Args>
  void emplace_back(Args&& ... args) {
    m_stdvector.emplace_back(std::forward<Args>(args)...);
    m_buffer = m_stdvector.data();
  }

  template<class... Args>
  iterator emplace(const_iterator pos, Args&& ... args) {
    m_stdvector.emplace(pos, std::forward<Args>(args)...);
    m_buffer = m_stdvector.data();
  }

};
template<class T, typename _Alloc>
std::ostream& operator<<(std::ostream& os, vector<T, _Alloc> const& obj) {
  return os << obj.str();
}

template <typename T, typename _Alloc>
std::ptrdiff_t operator-(const typename vector<T, _Alloc>::Iterator& a,
                         const typename vector<T, _Alloc>::Iterator& b)
{
  return a.m_ptr - b.m_ptr;
}

template <typename T, typename _Alloc>
std::ptrdiff_t operator-(const typename vector<T, _Alloc>::ConstIterator& a,
                         const typename vector<T, _Alloc>::ConstIterator& b)
{
  return a.m_ptr - b.m_ptr;
}

template <typename T, typename _Alloc>
typename vector<T, _Alloc>::Iterator operator+(const typename vector<T, _Alloc>::Iterator& a,
                                               int increment)
{
  auto result = vector<T, _Alloc>::Iterator(a);
  result += increment;
  return result;
}

template <typename T, typename _Alloc>
typename vector<T, _Alloc>::Iterator operator-(const typename vector<T, _Alloc>::Iterator& a,
                                               int increment)
{
  auto result = vector<T, _Alloc>::Iterator(a);
  result -= increment;
  return result;
}



/*!
 * @brief A template for a container class like std::array<T> but with the following features.
 *
 * - Memory is provided from one of the following.
 *   - allocated internally using molpro::allocator<T> which uses a managed stack
 *   - attached to an existing raw array T[], std::vector<T> or std::array<T,N>,
 *   allowing one to optionally attach the
 *   container to existing data structures, and use the same syntax as std::array<T,N>
 *   to access it. In this case, the buffer is not deallocated on destruction of this object.
 *   It is the user's responsibility to ensure, in the case of std::vector<T> source, that the
 *   source is not subsequently resized or otherwise changed in a way that its data is moved.
 * - The interface is slightly different to std::array<T,N> in that the length is provided
 * or implied in the constructor rather than as a template argument.
 * - The class is inheritable.
 * - A string representation function is provided for easy printing
 *
 * Elements of the array are not constructed at allocation time, for reasons of efficiency,
 * leading to a construction time that is approximately independent of
 * the array size.
 *
 * \tparam T Type of the elements of the array.
 *
 * Example:
 * \code
 * #include "memory.h"
 * int main() {
 * memory_initialize(40); // bytes
 * {
 *   molpro::array<> arr(5);
 *   for (size_t i=0; i<arr.size(); i++) arr[i]=100*i;
 *   for (molpro::array<>::iterator el=arr.begin(); el!=arr.end(); el++)
 *     std::cout << "array element "<<*el<<std::endl;
 * } // arr will release its buffer and be destroyed on going out of scope
 * int v[]={1,2,3,4,5,6};
 * {
 *   molpro::array<int> arr(v,6);
 *   for (molpro::array<double>::iterator el=arr.begin(); el!=arr.end(); el++)
 *     *el=99;
 * } // arr is destroyed, but (modified) v survives
 * std::cout << v[0] << std::endl;
 * return 0; }
 * \endcode
 */
template<typename T=double>
class array {
/* The _Alloc template argument is only provided to let molpro::array have
   the same signature as std::array. They must have same signature if you
   want a templated container (ie allowing use of std::array OR molpro::array)
   when using ifort15. See bug 5299. // TODO consider this
*/
 private:
  allocator<T> m_allocator;
  size_t m_length; // length of unmanaged buffer, or zero to signal managed buffer
  bool m_owned; // if the data is owned by this object rather than mapped
  T* m_buffer; // pointer to the buffer

 public:
  /*!
   * \brief Construct an array of type T with managed storage.
   * \param length The number of elements of buffer.
   */
  explicit array<T>(size_t const length = 0)
      : m_allocator(), m_length(length), m_owned(true)
//      , m_buffer(reinterpret_cast<T*>(new void*[length * sizeof(T)]))
      , m_buffer(m_allocator.allocate(length)) {
//    std::cout << "construct molpro::array"<<length<<std::endl;
  }

/*!
 * \brief Construct an array of type T with managed storage.
 * \param length The number of elements of buffer.
 * \param value The value to assign to all elements of the buffer.
 */
  array<T>(size_t const length, const T& value)
      : m_allocator(), m_length(length), m_owned(true), m_buffer(m_allocator.allocate(length)) { assign(value); }

/*!
 * \brief Construct an array of type T with managed storage.
 * \param first Starting iterator of array to copy
 * \param last Ending iterator of array to copy
 */
  template<class InputIterator>
  array<T>(InputIterator
           first,
           InputIterator last
  )
      : m_allocator(), m_length(last - first), m_buffer(m_allocator.allocate(last - first)), m_owned(true) {}

/*!
 * \brief Construct a vector of type T with managed storage.
 * \param il Initializer list
 */
  array<T>(std::initializer_list<T>
           il)
      : m_allocator(), m_length(il.size()),
        m_buffer(m_allocator.allocate(il.size())), m_owned(true) { std::copy(il.begin(), il.end(), begin()); }

/*!
 * \brief Construct an array of type T by attaching to an existing buffer.
 * \param buffer Pointer to an existing array of type T.
 * \param length The number of elements of buffer.
 */
  array<T>(T* const buffer, size_t const length)
      :
      m_length(length), m_owned(false), m_buffer(buffer) {}

/*!
 * \brief Construct an array of type T by attaching to an existing buffer.
 * \param array Existing std::array of type T whose buffer will be used.
 */
  template<std::size_t N>
  explicit array<T>(std::array<T, N>& array)
      : m_length(array.size()), m_owned(false), m_buffer(array.data()) {}

/*!
 * \brief Construct an array of type T by attaching to an existing buffer.
 * \param array Existing std::vector of type T whose buffer will be used. Any subsequent external reallocation of array will cause chaos.
 */
  explicit array<T>(std::vector<T>& array)
      : m_length(array.size()), m_owned(false), m_buffer(array.data()) {}

/*!
 * \brief array<T> Copy constructor
 * \param source An existing object. An element-by-element copy is made, i.e. the data buffer is allocated then copied from source.
 */
  array<T>(const array<T>& source)
      : m_allocator(), m_length(source.size()), m_owned(true), m_buffer(m_allocator.allocate(source.size())) {
    std::copy(source.begin(), source.end(), begin());
  }

/*!
 * \brief Copy assignment operator
 */
  array<T>& operator=(const array<T>& copy) {
    if (&copy == this) return *this;
    if (copy.size() != m_length) throw std::runtime_error("Unequal length copy not supported");
    std::copy(copy.begin(), copy.end(), this->begin());
    return *this;
  }

  virtual ~array() {
    if (m_owned) m_allocator.deallocate(m_buffer, m_length);
  }

  T& operator[](size_t n) {
    assert(m_length == 0 || (n <= m_length));
    return m_buffer[n];
  }
  const T& operator[](size_t n) const {
    assert(m_length == 0 || (n <= m_length));
    return m_buffer[n];
  }
/*!
 * \brief Assign new contents to the array, replacing its current contents
 * \param first Starting iterator of array to copy
 * \param last Ending iterator of array to copy
 */
  template<class InputIterator>
  void assign(InputIterator first, InputIterator last) {
    if (last - first != m_length) throw std::runtime_error("Unequal lengths in copy");
    std::copy(first, last, begin());
  }
/*!
 * \brief Assign new contents to the array, replacing its current contents
 * \param value The value to set all elements of the array to.
 */
  void assign(const T& value) {
    std::fill(begin(), end(), value);
  }
/*!
 * \brief Assign new contents to the array, replacing its current contents
 * \param n The new number of elements
 * \param value The value to set all elements of the array to.
 */
  void assign(size_t n, const T& value) {
    {
      if (n != m_length) throw std::runtime_error("Unequal lengths in copy");
      assign(value);
    }
  }
/*!
 * \brief Assign new contents to the array, replacing its current contents
 * \param il An initializer. The array is resized to match the length of il.
 */
  void assign(std::initializer_list<T> il) {
    if (il.size() != m_length) throw std::runtime_error("Unequal lengths in copy");
    std::copy(il.begin(), il.end(), begin());
  }

  T& at(size_t n) {
    if (n < m_length) return m_buffer[n]; else throw std::out_of_range("array::at() out of range");
  }

  const T& at(size_t n) const {
    if (n < m_length) return m_buffer[n]; else throw std::out_of_range("array::at() out of range");
  }

  T& back() noexcept {
    return m_buffer[size() - 1];
  }

  const T& back() const noexcept {
    return m_buffer[size() - 1];
  }

  bool empty() const noexcept {
    return m_length == 0;
  }

  T& front() noexcept {
    return m_buffer[0];
  }

  const T& front() const noexcept {
    return m_buffer[0];
  }

  T* data() noexcept { return &front(); }
  const T* data() const noexcept { return &front(); }

  size_t max_size() const noexcept {
    return m_length;
  }

  size_t size() const noexcept {
    return m_length;
  }

/*!
 * \brief Exchange the content of the container by the content of x, which is another object of the same type.
 * \param x Another array of the same type.
 */
  void swap(array<T>& x) { swap(*this, x); }

  friend void swap(array<T>& a, array<T>& b) {
    std::swap(a.m_buffer, b.m_buffer);
    std::swap(a.m_length, b.m_length);
    std::swap(a.m_owned, b.m_owned);
  }

  template <bool IsConst>
  class MyIterator {
  public:
    using iterator_category = std::forward_iterator_tag;
    using value_type = T;
    using difference_type = std::ptrdiff_t;
    using pointer = T*;
    using reference = T&;
    MyIterator() noexcept : m_ptr(nullptr) {}
    MyIterator(pointer ptr) : m_ptr(ptr) {}
    MyIterator(const MyIterator&) = default;
    template<bool IsConst_ = IsConst, class = std::enable_if_t<IsConst_>>
    MyIterator(const MyIterator<false>& rhs) : m_ptr(rhs.m_ptr) {}

    reference operator*() const noexcept { return *m_ptr; }
    pointer operator->() const noexcept { return m_ptr; }
    MyIterator& operator++() {m_ptr++; return *this; }
    MyIterator operator++(int) {MyIterator tmp = *this; ++(*this); return tmp; }
    MyIterator& operator--() {m_ptr--; return *this; }
    MyIterator operator--(int) {MyIterator tmp = *this; --(*this); return tmp; }
    friend bool operator==(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr == rhs.m_ptr;}
    friend bool operator!=(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr != rhs.m_ptr;}
    friend bool operator<(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr < rhs.m_ptr;}
    friend bool operator>(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr > rhs.m_ptr;}
    friend bool operator<=(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr <= rhs.m_ptr;}
    friend bool operator>=(const MyIterator& lhs, const MyIterator& rhs) {return lhs.m_ptr >= rhs.m_ptr;}
    friend class MyIterator<true>;
    friend class MyIterator<false>;
  private:
    pointer m_ptr;
  };

  using Iterator = MyIterator<false>;
  using ConstIterator = MyIterator<true>;

  typedef Iterator iterator;
  typedef ConstIterator const_iterator;

  iterator begin() noexcept { return iterator(m_buffer); }
  const_iterator begin() const noexcept { return cbegin(); }
  const_iterator cbegin() const noexcept { return const_iterator(m_buffer); }

  iterator end() noexcept { return m_buffer + size(); }
  const_iterator end() const noexcept { return cend(); }
  const_iterator cend() const noexcept { return const_iterator(m_buffer + size()); }

  using reverse_iterator = std::reverse_iterator<Iterator>;
  using const_reverse_iterator = std::reverse_iterator<ConstIterator>;
  reverse_iterator rbegin() noexcept { return reverse_iterator(end()); }
  const_reverse_iterator rbegin() const noexcept { return const_reverse_iterator(end()); }
  const_reverse_iterator crbegin() const noexcept { return const_reverse_iterator(cend()); }
  reverse_iterator rend() noexcept { return reverse_iterator(begin()); }
  const_reverse_iterator rend() const noexcept { return const_reverse_iterator(begin()); }
  const_reverse_iterator crend() const noexcept { return const_reverse_iterator(cend()); }


/*!
 * \brief Generate a printable representation of the object
 * \param verbosity If zero, express only the length of the object; otherwise, its elements.
 * \param columns If given, a line wrap will be generated every columns values.
 * \return
 */
  std::string str(int verbosity = 1, unsigned int columns = UINT_MAX) const {
    std::ostringstream s;
    if (verbosity == 0)
      s << size();
    else if (verbosity > 0) {
      for (size_t i = 0; i < size(); i++) {
        if (i > 0) {
          if (i % columns)
            s << " ";
          else
            s << std::endl;
        }
        s << at(i);
      }
    }
    return s.str();
  }
};

template<class T>
std::ostream& operator<<(std::ostream& os, array<T> const& obj) {
  return os << obj.str();
}

}

#endif
