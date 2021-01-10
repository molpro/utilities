#ifndef UTILITIES_SRC_MOLPRO_MPI_H_
#define UTILITIES_SRC_MOLPRO_MPI_H_
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
MPI_Comm comm_self() {
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

/*!
 * @brief Return the MPI communicator containing all processes available for participation in computation.
 * If MPI support has been compiled (either mpi.h has already been included, or HAVE_MPI_H has been defined) but not yet
 * initialised, MPI will be initialised, and then MPI_COMM_WORLD is selected. Otherwise, in the case of a program
 * compiled with PPIDD, and for which PPIDD has already been initialised, this will be the PPIDD worker communicator.
 * Otherwise,
 * in the case of a program compiled with GA, and for which GA has already been initialised, this will be the GA worker
 * communicator. Otherwise, if MPI support has is active, MPI_COMM_WORLD is selected. Otherwise (completely serial
 * code), a place-holder is chosen.
 * @return The global communicator
 */
MPI_Comm comm_global() {
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
#ifdef PPIDD_H
  {
    int64_t size;
    PPIDD_Size(&size);
    if (size > 0)
      return MPI_Comm_c2f(PPIDD_Worker_comm());
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

} // namespace mpi
} // namespace molpro

/*!
 * @brief C binding of mpi::comm_global(), suitable for calling from Fortran
 */
extern "C" int64_t mpicomm_global() { return (int64_t) MPI_Comm_c2f(molpro::mpi::comm_global()); }

/*!
 * @brief C binding of mpi::comm_self(), suitable for calling from Fortran
 */
extern "C" int64_t mpicomm_self() { return (int64_t) MPI_Comm_c2f(molpro::mpi::comm_self()); }
#endif // UTILITIES_SRC_MOLPRO_MPI_H_
