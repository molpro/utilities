#include <fstream>
#include <gtest/gtest.h>
#include <iostream>
#include <molpro/iostream.h>

inline std::string file_contents(const std::string& path) {
  std::ostringstream buf;
  std::ifstream input(path.c_str());
  buf << input.rdbuf();
  return buf.str();
}

void xout_close();

TEST(iostream, redirect) {
  std::string message{"Hello!"};
  molpro::cout << message << std::endl;
  xout_close();
  ASSERT_EQ(file_contents("test-iostream.log"), message + "\n");
}
