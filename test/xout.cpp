#include <fstream>
#include <ostream>
extern std::ostream& xout;
std::ofstream s_xout("test-iostream.log");
std::ostream& xout = s_xout;
void xout_close() { s_xout.close(); }
