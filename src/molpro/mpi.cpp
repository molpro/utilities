#include <molpro/mpi.h>

extern "C" int64_t mpicomm_global() { return (int64_t)MPI_Comm_c2f(molpro::mpi::comm_global()); }

extern "C" int64_t mpicomm_self() { return (int64_t)MPI_Comm_c2f(molpro::mpi::comm_self()); }

int molpro::mpi::init() {
#ifdef _HAVE_MPI_H
  return MPI_Init(0, nullptr);
#else
  return 0;
#endif
}

int molpro::mpi::finalize() {
#ifdef _HAVE_MPI_H
  return MPI_Finalize();
#else
  return 0;
#endif
}

extern "C" int mpi_init() { return molpro::mpi::init(); }
extern "C" int mpi_finalize() { return molpro::mpi::finalize(); }
