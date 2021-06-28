#include <gmock/gmock.h>
#include <gtest/gtest.h>
#include <molpro/Options.h>

TEST(options, construct) {
  molpro::Options opt("TESTPROG", "&TESTPROG stringtest=stringvalue, inttest=123, floattest=4.567, &END");
  EXPECT_EQ(opt.parameter("stringtest", ""), "stringvalue");
  EXPECT_EQ(opt.parameter("inttest", 0), 123);
  EXPECT_EQ(opt.parameter("floattest", double(0)), 4.567);
  EXPECT_EQ(opt.parameter("undefined", "anything"), "anything");
  EXPECT_EQ(opt.parameter("undefined", 99), 99);
  EXPECT_EQ(opt.parameter("undefined", double(99)), double(99));
  opt.addParameter("added", "addedvalue");
  EXPECT_EQ(opt.parameter("added", "anything"), "addedvalue");
  auto intvector = std::vector<int>{11, 12, 13};
  opt.addParameter("intvector", intvector);
  EXPECT_THAT(opt.parameter("intvector", decltype(intvector)()), ::testing::ContainerEq(intvector));
  EXPECT_EQ(opt.parameter("intvector1", decltype(intvector)()).size(), size_t(0));
  EXPECT_EQ(opt.parameter("intvector1", intvector).size(), intvector.size());
  EXPECT_THAT(opt.parameter("intvector1", intvector), ::testing::ContainerEq(intvector));
}

TEST(Options, construct_from_args) {
char* argv[4];
argv[0] = strdup("program");
  argv[1] = strdup("stringtest=stringvalue");
  argv[2] = strdup("inttest=123");
  argv[3] = strdup("floattest=4.567");
  molpro::Options opt("TESTPROG",4, argv);
  EXPECT_EQ(opt.parameter("stringtest", ""), "stringvalue");
  EXPECT_EQ(opt.parameter("inttest", 0), 123);
  EXPECT_EQ(opt.parameter("floattest", double(0)), 4.567);
  EXPECT_EQ(opt.parameter("undefined", "anything"), "anything");
  EXPECT_EQ(opt.parameter("undefined", 99), 99);
  EXPECT_EQ(opt.parameter("undefined", double(99)), double(99));
  opt.addParameter("added", "addedvalue");
  EXPECT_EQ(opt.parameter("added", "anything"), "addedvalue");
  auto intvector = std::vector<int>{11, 12, 13};
  opt.addParameter("intvector", intvector);
  EXPECT_THAT(opt.parameter("intvector", decltype(intvector)()), ::testing::ContainerEq(intvector));
  EXPECT_EQ(opt.parameter("intvector1", decltype(intvector)()).size(), size_t(0));
  EXPECT_EQ(opt.parameter("intvector1", intvector).size(), intvector.size());
  EXPECT_THAT(opt.parameter("intvector1", intvector), ::testing::ContainerEq(intvector));
}
