#ifndef MOLPRO_IOSTREAM_H_
#define MOLPRO_IOSTREAM_H_
#include <iostream>

#ifdef EXTERN_OSTREAM_COUT
extern std::ostream& EXTERN_OSTREAM_COUT;
namespace molpro {
static auto& cout = EXTERN_OSTREAM_COUT;
}
#else
namespace molpro {
/*!
 * In normal use, an alias for std::cout, but can be overriden
 * at compile time by defining EXTERN_OSTREAM_COUT as the name of
 * an existing extern std::ostream.
 */
static auto& cout = std::cout;
} // namespace molpro
#endif

#ifdef EXTERN_OSTREAM_CERR
extern std::ostream& EXTERN_OSTREAM_CERR;
namespace molpro {
static auto& cerr = EXTERN_OSTREAM_CERR;
}
#else
namespace molpro {
static auto& cerr = std::cerr;
}
#endif

#endif // MOLPRO_IOSTREAM_H_
