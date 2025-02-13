#include <gtest/gtest.h>
#include <molpro/mpi.h>

TEST(mpi, construct) {
  EXPECT_EQ(molpro::mpi::comm_global(),MPI_COMM_WORLD);
  EXPECT_EQ(molpro::mpi::comm_self(),MPI_COMM_SELF);
}
