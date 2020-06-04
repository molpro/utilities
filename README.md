iostream library {#mainpage}
============================

This library consists simply of the header ``molpro/iostream.h`` which contains definitions of ``molpro::cout`` and ``molpro::stderr`` which should be used in any library instead of ``std::cout`` and ``std::cerr``.
By default, they are simply an alias for the `std::` streams, but
clients of the library can then, if desired, redirect by defining `EXTERN_OSTREAM_COUT` as the desired `extern std::ostream&`.

Documentation is installed at
(https://molpro.gitlab.io/iostream)
[https://molpro.gitlab.io/iostream]

