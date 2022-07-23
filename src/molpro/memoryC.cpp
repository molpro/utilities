#include <cstddef>
#include <unordered_map>
size_t _private_memory_used = 0;
size_t _private_memory_maximum_allocatable = 0;
std::unordered_map<char*, size_t> _private_memory_lengths;
#include <molpro/memory.h>
