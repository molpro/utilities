#include <fstream>
extern std::ofstream& xout;
std::ofstream s_xout = std::ofstream("test-iostream.log");
std::ofstream& xout = s_xout;
void xout_close() { xout.close(); }
