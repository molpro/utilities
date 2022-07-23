#ifndef BYTESTREAM_H
#define BYTESTREAM_H
#include <molpro/memory.h>
#include <cstdint>

namespace molpro {
/*!
 * \brief Type for integers stored in a bytestream. The intention is that these should
 * match the Fortran standard integer, to allow bytestreams to be interchanged between
 * Fortran and C++.
 */
#ifdef MEMORY_I8
typedef int64_t fint;
#else
typedef int32_t fint;
#endif

/*!
* \brief The bytestream class provides a container for data to be serialised, and subsequently unpacked.
*/
class bytestream {
 public:
  /*!
   * \brief Construct an empty bytestream object.
   */
  bytestream();
  /*!
   * \brief Construct a bytestream object to contain the raw data of a previous bytestream construction.
   * \param buffer The data obtained from a previous construction of a bytestream.
   */
  bytestream(const char* buffer);
  ~bytestream();
  /*!
   * \brief Interpret the next array in the object as an array of doubles,
   * advance the pointer to the following object, and return the array.
   * \return
   */
  molpro::array<double> doubles();
  /*!
   * \brief Interpret the next array in the object as an array of integers,
   * advance the pointer to the following object, and return the array.
   * \return
   */
  molpro::array<fint> ints();
  /*!
   * \brief Interpret the next array in the object as an array of characters,
   * advance the pointer to the following object, and return the array.
   * \return
   */
  molpro::array<char> chars();
  // note that there cannot be an implementation like this for booleans because of lack of std::vector<bool>

  /*!
   * \brief Interpret the next item in the object as a bytestream,
   * advance the pointer to the following object, and return the item.
   * \return
   */
  bytestream byteStream();
  /*!
   * \brief Reset the pointer to the beginning of the buffer
   */
  void reset();

  /*!
   * \brief Add a double array to the bytestream.
   * \param array Source of data.
   * \param length Length of data.
   */
  void append(const double* array, size_t length = 1);
  /*!
   * \brief Add an integer array to the bytestream.
   * \param array Source of data. The integers should be of type \ref fint;
   * however, there is also a template function that copies to \ref fint from other integer types,
   * and then calls this function.
   * \param length Length of data.
   */
  void append(const fint* array, size_t length = 1);
  /*!
   * \brief Add a char array to the bytestream.
   * \param array Source of data.
   * \param length Length of data.
   */
  void append(const char* array, size_t length = 1);

  void append(const bytestream& bs);

#ifdef MEMORY_I8
  void append(const int *array, size_t length=1) {
    std::vector<fint> buffer(length);
    for (size_t i=0; i<length; i++)
      buffer[i] = array[i];
    append(buffer.data(),length);
  }
#endif

  void append(size_t i) {
    fint v = i;
    append(&v);
  }

  // for other integer types
  template<class T>
  void append(const T* array, size_t length = 1) {
    std::vector<fint> o(length);
    for (size_t k = 0; k < length; k++) o[k] = array[k];
    append(&o[0], o.size());
  }

  template<class T>
  void append(const std::vector<T> array) {
    std::vector<fint> o;
    for (auto& i : array) o.push_back(i);
    append(&o[0], o.size());
  }

  /*!
   * \brief The size of the bytestream data.
   * \return
   */
  size_t size() const;
  /*!
   * \brief The current position in the bytestream data during unpacking through
   * successive calls to doubles(), ints() or chars().
   * \return
   */
  size_t position() const;
  /*!
   * \brief The raw data of the object.
   * \return
   */
  const std::vector<char>& data() const { return buffer; }

  void dump();

  size_t hash() const;

 private:
  enum datatypes { datatype_char = 0, datatype_int = 1, datatype_double = 2, datatype_bool = 3 };

  struct metadata { size_t length; enum datatypes datatype; };
  /*!
   * \brief Decode the metadata and advance the pointer
   */
  bytestream::metadata get_metadata();
  /*!
   * \brief Push metadata to the stream
   * \param length
   * \param datatype
   */
  void put_metadata(size_t length, enum datatypes datatype);
  std::vector<char> buffer;
  size_t pointer;
};
}

extern "C" size_t memory_bytestream_hash(const char* s, size_t n);

#endif // BYTESTREAM_H
