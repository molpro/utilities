#include "memory.h"

namespace molpro::memory::detail
{
    size_t& used()
    {
        static size_t s_used{0};
        return s_used;
    }

    size_t& maximum_allocatable()
    {
        static size_t s_maximum_allocatable{0};
        return s_maximum_allocatable;
    }

    std::unordered_map<char*, size_t>& lengths()
    {
        static std::unordered_map<char*, size_t> s_lengths;
        return s_lengths;
    }
}
