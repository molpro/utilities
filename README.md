Molpro utilities library
=================

This library consists of various utilities needed for Molpro and its libraries:
 - the header ``molpro/iostream.h`` which contains definitions of ``molpro::cout`` and ``molpro::stderr`` which should be used in any library used in Molpro instead of ``std::cout`` and ``std::cerr``.
By default, they are simply an alias for the `std::` streams, but
clients of the library can then, if desired, redirect by defining `EXTERN_OSTREAM_COUT` as the desired `extern std::ostream&`.
   
 - the header ``molpro/mpi.h`` which provides functions that return the global and self communicators. These work when there is no MPI support compiled, and when running under [Global Arrays](https://hpc.pnl.gov/globalarrays/) or [PPIDD](https://gitlab.com/molpro/ppidd), where MPI_COMM_WORLD is not the appropriate global communicator.

 - the header ``molpro/Options.h`` which provides a class that manages input options. In the Molpro context, these are input parameters; elsewhere, they can be injected from a Fortran namelist.

Documentation is installed at
[molpro.gitlab.io/utilities](https://molpro.gitlab.io/utilities)

