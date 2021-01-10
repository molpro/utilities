#include <gtest/gtest.h>
#include <molpro/mpi.h>

TEST(mpi, construct) {
  EXPECT_EQ(molpro::mpi::comm_global(),molpro::mpi::comm_self());
}
