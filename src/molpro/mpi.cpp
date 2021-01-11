#include <molpro/mpi.h>

extern "C" int64_t mpicomm_global() { return (int64_t)MPI_Comm_c2f(molpro::mpi::comm_global()); }

/*!
 * @brief C binding of mpi::comm_self(), suitable for calling from Fortran
 */
extern "C" int64_t mpicomm_self() { return (int64_t)MPI_Comm_c2f(molpro::mpi::comm_self()); }
