#include "molpro/bytestreamC.h"
#include <cstring>
#include <cassert>
#include <algorithm>
#include <iostream>
#include <molpro/iostream.h>

bool debug_bytestream = false;
using molpro::bytestream;
using molpro::fint;

bytestream::bytestream() {
  buffer.resize(8);
  reset();
}

bytestream::bytestream(const char* buffer) {
  int64_t length64;
  std::memcpy(&length64, buffer, 8);
  size_t length = length64;
//  molpro::cout <<"bytestream constructor from buffer length "<<length<<std::endl;
  this->buffer.resize(length);
  for (size_t k = 0; k < length; k++) this->buffer[k] = buffer[k];
  reset();
}

bytestream::~bytestream() {
}

molpro::array<double> bytestream::doubles() {
  bytestream::metadata md = get_metadata();
//  uint64_t mdd[2]; memcpy(&mdd,&md,16); printf("metadata: %16X %16X\n",mdd[0],mdd[1]);
  assert (md.datatype == datatype_double);
//  molpro::cout << "md.length="<<md.length<<std::endl;
  pointer += 7 - (pointer - 1) % 8;
//  molpro::cout << "bytestream::doubles() raw double data, pointer="<<pointer<<std::endl;
//  for (size_t k=0; k<md.length; k++) {
//  dump();
//      double d;
//    memcpy(&d,&((buffer)[pointer+k*8]),8);
//    printf("%f",d);
//    uint8_t i;
//    for (size_t l=0; l<8; l++) {
//        memcpy(&i,&(buffer)[pointer+k*8+l],1);
//      printf(" %2X",i);
//      }
//    printf("\n");
//    }
  molpro::array<double> result(md.length);
  std::memcpy(&result[0], &((buffer)[pointer]), md.length * sizeof(result[0]));
  pointer += md.length * sizeof(result[0]);
//  molpro::cout << "bytestream::doubles() final pointer="<<pointer<<", size()="<<size()<<std::endl;
  if (debug_bytestream) std::cout << "bytestream::doubles() " << md.length * sizeof(result[0]) << std::endl;
  return result;
}

molpro::array<fint> bytestream::ints() {
  bytestream::metadata md = get_metadata();
//  molpro::cout << "bytestream::ints md.datatype="<<md.datatype<<", md.length="<<md.length<<", pointer="<<pointer<<std::endl;
  assert (md.datatype == datatype_int);
  molpro::array<fint> result(md.length);
  std::memcpy(&result[0], &((buffer)[pointer]), md.length * sizeof(result[0]));
//  molpro::cout << "result[0]="<<result[0]<<std::endl;
  pointer += md.length * sizeof(result[0]);
//  molpro::cout << "pointer advanced to "<<pointer<<std::endl;
  if (debug_bytestream) std::cout << "bytestream::ints() " << md.length * sizeof(result[0]) << std::endl;
  return result;
}

molpro::array<char> bytestream::chars() {
  bytestream::metadata md = get_metadata();
  assert (md.datatype == datatype_char);
//  std::cout << "bytestream::chars()" <<md.length<< std::endl;
//  if (md.length>7){int64_t l; std::memcpy(&l,&buffer[pointer],8); printf("first 8 bytes %llX %lld\n",l,l);}
  molpro::array<char> result((char*) &((buffer)[pointer]), md.length);
//  if (md.length>7){int64_t l; std::memcpy(&l,&result[0],8); printf("first 8 bytes %llX %lld\n",l,l);}
  pointer += md.length * sizeof(result[0]);
//  molpro::cout << "bytestream::chars() pointer advanced to "<<pointer<<std::endl;
  if (debug_bytestream) std::cout << "bytestream::chars() " << md.length * sizeof(result[0]) << std::endl;
  return result;
}

bytestream bytestream::byteStream() {
//  std::cout << "byteStream()"<<std::endl;
  std::string ss;
  {
    auto s = chars();
//    std::cout << "character array size extracted "<<s.size()<<std::endl;
//    int64_t l; std::memcpy(&l,&s[0],8); printf("first 8 bytes %llX %lld\n",l,l);
    ss.resize(s.size());
    std::memcpy(&ss[0], &s[0], s.size());
  }
//    std::cout << "string size extracted "<<ss.size()<<std::endl;
  bytestream bs;
  bs.buffer.resize(ss.size());
  bs.reset();
  std::memcpy((void*) &((bs.buffer)[0]), &ss[0], ss.size());
  if (debug_bytestream) std::cout << "bytestream::byteStream " << ss.size() << std::endl;
  if (debug_bytestream) std::cout << "bytestream::byteStream " << bs.size() << std::endl;
  return bs;
}

bytestream::metadata bytestream::get_metadata() {
  bool bigend;
  {
    int tester = 1;
    bigend = (*(char*) &tester != 1);
  } // bigendian or littlendian
  bytestream::metadata result;
  size_t control = pointer++;
//  printf("buffer[control]: %X %X\n",(buffer)[control],((uint8_t) (buffer)[control]) & 3);
  switch (((uint8_t) (buffer)[control]) & 3) {
    case 0:
      result.datatype = datatype_char;
      break;
    case 1:
      result.datatype = datatype_int;
      break;
    case 2:
      result.datatype = datatype_double;
      break;
    case 3:
      result.datatype = datatype_bool;
      break;
    default: break;
  }
  // skip over lower bounds as they have no relevance in C++
  switch ((((uint8_t) (buffer)[control]) & 0x1C) >> 2) {
    case 1: pointer += 8;
      break;
    case 6: pointer += 4;
      break;
    case 2: pointer += 2;
      break;
    case 4: pointer += 1;
      break;
    default: break;
  }
  uint64_t length = 0;
  char* lp = (char*) &length;
  switch ((((uint8_t) (buffer)[control]) & 0xE0) >> 5) {
    case 0: length = 1;
      break;
    case 1: std::memcpy(lp, &(buffer)[pointer], 8);
      pointer += 8;
      break;
    case 6: std::memcpy(lp + (bigend ? 4 : 0), &(buffer)[pointer], 4);
      pointer += 4;
      break;
    case 2: std::memcpy(lp + (bigend ? 6 : 0), &(buffer)[pointer], 2);
      pointer += 2;
      break;
    case 4: std::memcpy(lp + (bigend ? 7 : 0), &(buffer)[pointer], 1);
      pointer += 1;
      break;
    default: break;
  }
  result.length = length;
  return result;
}

void bytestream::put_metadata(size_t length, enum datatypes datatype) {
  bool bigend;
  {
    int tester = 1;
    bigend = (*(char*) &tester != 1);
  } // bigendian or littlendian
  assert (not bigend);
//  molpro::cout << "put_metadata pointer="<<pointer<<", datatype="<<datatype<<std::endl;memory_print_status();
  if (bigend) return; // to keep compiler happy
  (buffer)[pointer++] =
      datatype | (length > 2147483647 ? 0x20 : (length > 32767 ? 0xC0 : (length > 127 ? 0x40 : 0x80)));
  size_t l = (length > 2147483647 ? 8 : (length > 32767 ? 4 : (length > 127 ? 2 : 1)));
  std::memcpy(&(buffer)[pointer], &length, l);
  size_t lb = 0;
  std::memcpy(&lb, &(buffer)[pointer], l);
  pointer += l;
//  molpro::cout << "end put_metadata pointer="<<pointer<<std::endl;memory_print_status();
}

void bytestream::append(const double* array, size_t length) {
  if (debug_bytestream) std::cout << "bytestream::append(double*," << length << ")" << std::endl;
  pointer = size();
  buffer.resize(pointer + 17);
//  molpro::cout << "sending datatype_double="<<datatype_double<<std::endl;
  put_metadata(length, datatype_double);
  // pad to align double
//  molpro::cout << "bytestream append double, length="<<length<<", data pointer="<<pointer<<std::endl;
  pointer += 7 - (pointer - 1) % 8;
  buffer.resize(pointer + length * sizeof(*array));
//  molpro::cout << "bytestream append double, length="<<length<<", data pointer="<<pointer<<std::endl;
  std::memcpy(&(buffer)[pointer], array, length * sizeof(*array));
//  for (size_t k=0; k<length; k++) {
//      double d;
//    memcpy(&d,&((buffer)[pointer+k*8]),8);
//    printf("%f",d);
//    uint8_t i;
//    for (size_t l=0; l<8; l++) {
//        memcpy(&i,&(buffer)[pointer+k*8+l],1);
//      printf(" %2X",i);
//      }
//    printf("\n");
//    }
  uint64_t all = (uint64_t) size();
  std::memcpy(&(buffer)[0], &all, 8);
  pointer = 8;
}

#ifdef TEST_FORTRAN_INTEGER_SIZE // really, whether fortran_integer_size() is available
extern "C" { int fortran_integer_size(); }
#endif

void bytestream::append(const fint* array, size_t length) {
#ifdef TEST_FORTRAN_INTEGER_SIZE // really, whether fortran_integer_size() is available
  if (sizeof(*array) != fortran_integer_size()) molpro::cout << "sizeof(fint)="<<sizeof(*array)<<", fortran integer size="<<fortran_integer_size()<<std::endl;
  if (sizeof(*array) != fortran_integer_size()) throw std::logic_error("Wrong integer sizes, bytestream::append");
#endif
  if (debug_bytestream) std::cout << "bytestream::append(fint*," << length << ")" << std::endl;
  pointer = size();
//  molpro::cout << "bytestream::append bint:"<<array[0]<<" "<<length<<std::endl;
//  molpro::cout << "bytestream::append pointer=size()="<<pointer<<std::endl;
//  memory_print_status();
  buffer.resize(pointer + 17);
//  molpro::cout << "bytestream::append resized to pointer=size()="<<pointer<<" "<<size()<<std::endl;
//  memory_print_status();
  put_metadata(length, datatype_int);
//  molpro::cout << "back from put_metadata"<<std::endl;memory_print_status();
  buffer.resize(pointer + length * sizeof(*array));
//  molpro::cout << "bytestream::append resized to pointer size()="<<pointer<<" "<<size()<<std::endl;
//  memory_print_status();
//  molpro::cout << "bytestream::append writes data to "<<pointer<<", length "<<length*sizeof(*array)<<", first="<<*array<<std::endl;
  std::memcpy(&(buffer)[pointer], array, length * sizeof(*array));
  uint64_t all = (uint64_t) size();
  std::memcpy(&(buffer)[0], &all, 8);
  pointer = 8;
}

void bytestream::append(const char* array, size_t length) {
  if (debug_bytestream) std::cout << "bytestream::append(char*," << length << ")" << std::endl;
  pointer = size();
  buffer.resize(pointer + 17);
  put_metadata(length, datatype_char);
  buffer.resize(pointer + length);
  std::memcpy(&(buffer)[pointer], array, length * sizeof(*array));
  uint64_t all = (uint64_t) size();
  std::memcpy(&(buffer)[0], &all, 8);
//    {int64_t l; std::memcpy(&l,&buffer[0],8); printf("first 8 bytes %llX %lld\n",l,l);}
  pointer = 8;
}

void bytestream::append(const bytestream& bs) {
  if (debug_bytestream) std::cout << "bytestream::append(bytestream&) " << bs.size() << std::endl;
  append((const char*) &(bs.buffer)[0], bs.size());
}

void bytestream::reset() {
  pointer = 8;
}

size_t bytestream::size() const { return buffer.size(); }
size_t bytestream::position() const { return pointer; }

void bytestream::dump() {
  int i = 0;
  for (auto bss = buffer.begin(); bss != buffer.end(); bss++)
    printf("buffer byte %d: %X\n", i++, (unsigned char) *bss);
}

#include <string>
#include <functional>
size_t memory_bytestream_hash(const char* s, size_t n) {
  std::hash<std::string> strhash;
  return strhash(std::string(s, n));
}

size_t bytestream::hash() const {
  return memory_bytestream_hash(&buffer[0], size());
}
