#ifndef UTILITIES_SRC_MOLPRO_MPI_H_
#define UTILITIES_SRC_MOLPRO_MPI_H_

#include <cstdint>

#ifndef HAVE_MPI_H
#if defined(OMPI_MPI_H) || defined(MPI_INCLUDED)
#define HAVE_MPI_H
#endif
#endif

#ifdef HAVE_MPI_H
#include <mpi.h>
#else
/// \cond DO_NOT_DOCUMENT
#define MPI_Comm_c2f(x) x
using MPI_Comm = int64_t;
#define MPI_COMM_NULL 0
#define MPI_WIN_NULL 0
#define MPI_INFO_NULL 0
using MPI_Win = int64_t;
inline void _MPI_nullfunction(const void* x) {}
#define MPI_Barrier(x) _MPI_nullfunction(&x)
#define MPI_Win_free(x) _MPI_nullfunction(x)
#define MPI_Win_allocate(x1,x2,x3,x4,x5,x6) _MPI_nullfunction(x5)
#define MPI_Win_lock(x1,x2,x3,x4) _MPI_nullfunction(&x4)
#define MPI_Win_unlock(x1,x2) _MPI_nullfunction(&x2)
/// \endcond
#endif

#ifdef HAVE_GA_H
#include <ga.h>
#endif

#ifdef HAVE_PPIDD_H
#include <ppidd.h>
#endif

namespace molpro {
namespace mpi {

/*!
 * @brief Return MPI_COMM_SELF in an MPI program, or an appropriate dummy if not
 * @return MPI_COMM_SELF if MPI initialised, MPI_COMM_NULL otherwise, or 0 if MPI support not compiled
 */
inline MPI_Comm comm_self() {
#ifdef HAVE_MPI_H
  int flag;
  MPI_Initialized(&flag);
  if (!flag)
    return MPI_COMM_NULL;
  return MPI_COMM_SELF;
#else
  return 0;
#endif
}

#ifdef MOLPRO
extern "C" int molpro_mppx();
#endif

/*!
 * @brief Return the MPI communicator containing all processes available for participation in computation.
 * If MPI support has been compiled (either mpi.h has already been included, or HAVE_MPI_H has been defined) but not yet
 * initialised, MPI will be initialised, and then MPI_COMM_WORLD is selected. Otherwise, in the case of a program
 * compiled with PPIDD, and for which PPIDD has already been initialised, this will be the PPIDD worker communicator.
 * Otherwise,
 * in the case of a program compiled with GA, and for which GA has already been initialised, this will be the GA worker
 * communicator. Otherwise, if MPI support has is active, MPI_COMM_WORLD is selected. Otherwise (completely serial
 * code), a place-holder is chosen.
 * In the Molpro context, if running in mppx mode, MPI_COMM_SELF is always returned.
 * @return The global communicator
 */
inline MPI_Comm comm_global() {
#ifdef MOLPRO
  if (molpro_mppx()) return comm_self();
#endif
#ifdef HAVE_MPI_H
  int flag;
  MPI_Initialized(&flag);
  if (!flag) {
    MPI_Init(0, nullptr);
    return MPI_COMM_WORLD;
  }
#else
  return comm_self();
#endif
#ifdef __PPIDD_H__
  {
    int64_t size;
    PPIDD_Size(&size);
    if (size > 0)
      return MPI_Comm_f2c(PPIDD_Worker_comm());
  }
#else
#ifdef GA_H
  if (GA_MPI_Comm() != NULL && GA_MPI_Comm() != MPI_COMM_NULL) {
    return GA_MPI_Comm();
  }
#endif
#endif
#ifdef HAVE_MPI_H
  return MPI_COMM_WORLD;
#endif
  return comm_self();
}

/*!
 * @brief Query the size of the global MPI communicator
 * @return The size of the global communicator, or 1 if not using MPI
 */
inline int size_global() {
  int size = 1;
#ifdef HAVE_MPI_H
  MPI_Comm_size(comm_global(), &size);
#endif
  return size;
}

/*!
 * @brief Query the rank in the global MPI communicator
 * @return The rank in the global communicator, or 0 if not using MPI
 */
inline int rank_global() {
  int rank = 0;
#ifdef HAVE_MPI_H
  MPI_Comm_rank(comm_global(), &rank);
#endif
  return rank;
}

/*!
 * @brief In MPI environment initialize; otherwise do nothing. Intended to support MPI-agnostic programs.
 */
int init();
/*!
 * @brief In MPI environment finalize; otherwise do nothing
 */
int finalize();

} // namespace mpi
} // namespace molpro

/*!
 * @brief C binding of mpi::comm_global(), suitable for calling from Fortran
 */
extern "C" int64_t mpicomm_global();

/*!
 * @brief C binding of mpi::comm_self(), suitable for calling from Fortran
 */
extern "C" int64_t mpicomm_self();

/*!
 * @brief C binding of mpi::size_global(), suitable for calling from Fortran
 */
extern "C" int64_t mpisize_global();

/*!
 * @brief C binding of mpi::rank_global(), suitable for calling from Fortran
 */
extern "C" int64_t mpirank_global();

/*!
 * @brief C binding of mpi::init(), suitable for calling from Fortran
 */
extern "C" int mpi_init();

/*!
 * @brief C binding of mpi::finalize(), suitable for calling from Fortran
 */
extern "C" int mpi_finalize();
#endif // UTILITIES_SRC_MOLPRO_MPI_H_