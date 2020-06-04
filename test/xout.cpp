#include <fstream>
#include <iostream>
extern std::ofstream& xout;
// std::ostream& xout = std::cerr;
std::ofstream s_xout = std::ofstream("test-iostream.log");
std::ofstream& xout = s_xout;
void xout_close() { xout.close(); }
