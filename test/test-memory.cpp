#include <gmock/gmock.h>
#include <gtest/gtest.h>
#include <vector>
#include <chrono>
#include <molpro/memory.h>

#ifdef MOLPRO
#include <iostream>
const auto& xout=std::cout;
#endif

struct thing {
  thing() { if (false) std::cout << "thing constructor" << std::endl; }
};

TEST(utilities_memory, construct_chars) {
#ifdef MEMORY_FORTRAN
  std::vector<char> q(400000000);
  memory_initialize(q.data(), q.size());
#endif
  for (const auto& size : std::vector<size_t>{100, 1000, 10000, 100000, 1000000, 10000000, 100000000}) {
    using t = thing;
    auto start = std::chrono::steady_clock::now();
    molpro::vector<t, molpro::allocator<t> > v(size);
    auto end = std::chrono::steady_clock::now();
    auto tmemoryvector = end - start;
    std::cout << " length=" << size
              << ", t(memory::vector)="
              << std::chrono::duration_cast<std::chrono::nanoseconds>(tmemoryvector).count() * 1e-9
              << ", bandwidth="
              << size * 1.0e3 / std::chrono::duration_cast<std::chrono::nanoseconds>(tmemoryvector).count()
              << "M/s"
              << std::endl;
    start = std::chrono::steady_clock::now();
    std::vector<t> vv(size);
    end = std::chrono::steady_clock::now();
    auto tstdvector = end - start;
    std::cout << " length=" << size
              << ", t(std::vector)="
              << std::chrono::duration_cast<std::chrono::nanoseconds>(tstdvector).count() * 1e-9
              << ", bandwidth="
              << size * 1.0e3 / std::chrono::duration_cast<std::chrono::nanoseconds>(tstdvector).count()
              << "M/s"
              << std::endl;
    start = std::chrono::steady_clock::now();
    molpro::stdvector<t> vvv(size);
    end = std::chrono::steady_clock::now();
    auto tmemorystdvector = end - start;
    std::cout << " length=" << size
              << ", t(memory::stdvector)="
              << std::chrono::duration_cast<std::chrono::nanoseconds>(tmemorystdvector).count() * 1e-9
              << ", bandwidth="
              << size * 1.0e3 / std::chrono::duration_cast<std::chrono::nanoseconds>(tmemorystdvector).count()
              << "M/s"
              << std::endl;
    start = std::chrono::steady_clock::now();
    molpro::array<t> vvvv(size);
    end = std::chrono::steady_clock::now();
    auto tmemoryarray = end - start;
    std::cout << " length=" << size
              << ", t(memory::array)="
              << std::chrono::duration_cast<std::chrono::nanoseconds>(tmemoryarray).count() * 1e-9
              << ", bandwidth="
              << size * 1.0e3 / std::chrono::duration_cast<std::chrono::nanoseconds>(tmemoryarray).count()
              << "M/s"
              << std::endl;
  }
  std::cout << "memory_used " << memory_used(0) << std::endl;
}

TEST(utilities_memory, construction) {
  std::vector<char> q(200000000);
  memory_initialize(q.data(), q.size());
  molpro::vector<thing, molpro::allocator<thing> > array(4);
}

TEST(utilities_memory, vector_iterators) {
  std::array<int,4> q = {{1,2,3,4}};
  molpro::vector<int, molpro::allocator<int> > array(q.begin(), q.end());
  size_t count=0;
  for (const auto& i : array) {
    EXPECT_EQ(i,q[count++]);
  }
  count=0;
  for (auto it=array.begin();it!=array.end();it++) {
    EXPECT_EQ(*it,q[count++]);
  }
  count=0;
  for (auto it=array.cbegin();it!=array.cend();it++) {
    EXPECT_EQ(*it,q[count++]);
  }
  for (auto it=array.rbegin();it!=array.rend();it++) {
    EXPECT_EQ(*it,q[--count]);
  }
  for (auto it=array.begin();it!=array.end();it++) {
    *it=q[count++];
  }
  auto it=array.begin();
  it+=2;
  EXPECT_EQ(*it,q[2]);
  array.erase(array.begin(),array.end());
}

TEST(utilities_memory, array_iterators) {
  std::array<int,4> q = {{1,2,3,4}};
  molpro::array<int> array(q.size());
  size_t count=0;
  for (auto& i : array) {
    i = q[count++];
  }
  count=0;
  for (const auto& i : array) {
    EXPECT_EQ(i,q[count++]);
  }
  count=0;
  for (auto it=array.begin();it!=array.end();it++) {
    EXPECT_EQ(*it,q[count++]);
  }
  count=0;
  for (auto it=array.cbegin();it!=array.cend();it++) {
    EXPECT_EQ(*it,q[count++]);
  }
  for (auto it=array.rbegin();it!=array.rend();it++) {
    EXPECT_EQ(*it,q[--count]);
  }
  for (auto it=array.begin();it!=array.end();it++) {
    *it=q[count++];
  }
}
