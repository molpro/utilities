#include <gtest/gtest.h>
#include <molpro/mpi.h>

class MpiEnvironment : public ::testing::Environment {
public:
  void TearDown() override {
    int finalized;
    MPI_Finalized(&finalized);
    if (!finalized) MPI_Finalize();
  }
};

static auto* const mpi_env = ::testing::AddGlobalTestEnvironment(new MpiEnvironment);

TEST(mpi, construct) {
  EXPECT_EQ(molpro::mpi::comm_global(),MPI_COMM_WORLD);
  EXPECT_EQ(molpro::mpi::comm_self(),MPI_COMM_SELF);
}
