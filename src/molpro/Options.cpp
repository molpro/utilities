#ifdef MOLPRO
#include "cic/ItfFortranInt.h"
using itf::GetOptionF;
using itf::GetOptionI;
using itf::GetOptionS;
#else
#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#endif
#include "Options.h"
#include <iostream>
#include <sstream>
#include <algorithm>

namespace molpro {

Options::Options(std::string program, std::string input) : m_program(std::move(program)) {
  std::istringstream s(input);
  std::string ss;
  namelistData = ",";
  while (s >> ss && ss != "&END" && ss != "/")
    if (ss[0] != '&')
      namelistData.append(ss);
  namelistData.append(",DUMMY_KEY=,"); // dummy entry at end to simplify parsing
}

inline std::string args(int argc, char** argv) {
  std::string keyval;
  for (int i = 1; i < argc; ++i)
    keyval += std::string(i != 1 ? " " : "") + argv[i] + ",";
  return keyval;
}

Options::Options(std::string program, int argc, char **argv)
    : Options(program, std::string{"&"} + program + "\n" + args(argc, argv) + "\n&END") {}

std::vector<int> Options::parameter(const std::string &key,
                                    const std::vector<int> &def) const { // dirty sucking in from FCIDUMP namelist
  std::vector<int> answer;
  std::vector<std::string> strings = parameter(key, std::vector<std::string>(1, " "));
  if (strings == std::vector<std::string>(1, " "))
    return def;
  for (std::vector<std::string>::const_iterator s1 = strings.begin(); s1 != strings.end(); s1++) {
    int i;
    std::istringstream b(*s1);
    b >> i;
    answer.push_back(i);
  }
  return answer;
}

inline std::string upcase(const std::string& s) {
  auto u{s};
  std::for_each(u.begin(),u.end(), [](char& c){c=::toupper(c);});
  return u;
}

int Options::parameter(const std::string &key, int def) const {
#ifdef MOLPRO
  FORTINT r = GetOptionI(upcase(key).c_str(), upcase(m_program).c_str());
  if (r != (FORTINT)-1)
    return static_cast<int>(r);
#endif
  return parameter(key, std::vector<int>{def})[0];
}

double Options::parameter(const std::string &key, double def) const {
#ifdef MOLPRO
  FORTDBL r = GetOptionF(upcase(key).c_str(), upcase(m_program).c_str());
  return static_cast<double>(r);
#endif
  return parameter(key, std::vector<double>{def})[0];
}

std::vector<double> Options::parameter(const std::string &key,
                                       const std::vector<double> &def) const { // dirty sucking in from FCIDUMP namelist
  std::vector<double> answer;
  std::vector<std::string> strings = parameter(key, std::vector<std::string>(1, " "));
  if (strings == std::vector<std::string>(1, " "))
    return def;
  for (std::vector<std::string>::const_iterator s1 = strings.begin(); s1 != strings.end(); s1++) {
    double i;
    std::istringstream b(*s1);
    b >> i;
    answer.push_back(i);
  }
  return answer;
}

std::string Options::parameter(const std::string &key, const std::string &def) const {
#ifdef MOLPRO
  std::string r = GetOptionS(upcase(key).c_str(), upcase(m_program).c_str());
  if (r != std::string(""))
    return r;
#endif
  const std::vector<std::string> &vector1 = parameter(key, std::vector<std::string>(1, def));
  return vector1[0];
}
std::vector<std::string> Options::parameter(const std::string &key, const std::vector<std::string> &def) const {
  std::vector<std::string> answer;
  size_t pos = namelistData.find("," + key + "=");
  if (pos == std::string::npos)
    return def;
  pos = namelistData.find('=', pos) + 1;
  size_t pose = namelistData.find('=', pos);
  pose = namelistData.find_last_of(',', pose) + 1;
  for (size_t posNext = pos; posNext < pose; pos = posNext) {
    posNext = namelistData.find(',', pos) + 1;
    answer.push_back(namelistData.substr(pos, posNext - pos - 1));
  }
  return answer;
}

void Options::addParameter(const std::string &key, const std::vector<std::string> &values, bool echo) {
  if (echo) {
    std::cout << "Options::addParameter " << key << " = ";
    for (auto &v : values)
      std::cout << v << ",";
    std::cout << std::endl;
  }
  namelistData.erase(0, 1);
  for (auto s = values.rbegin(); s != values.rend(); s++)
    namelistData.insert(0, (*s) + ",");
  namelistData.insert(0, "," + key + "=");
}
void Options::addParameter(const std::string &key, const std::vector<int> &values, bool echo) {
  std::vector<std::string> valuess;
  for (int value : values) {
    std::ostringstream ss;
    ss << value;
    valuess.push_back(ss.str());
  }
  addParameter(key, valuess, echo);
}
void Options::addParameter(const std::string &key, const std::vector<double> &values, bool echo) {
  std::vector<std::string> valuess;
  for (double value : values) {
    std::ostringstream ss;
    ss << value;
    valuess.push_back(ss.str());
  }
  addParameter(key, valuess, echo);
}
void Options::addParameter(const std::string &key, const std::string &value, bool echo) {
  addParameter(key, std::vector<std::string>(1, value), echo);
}
void Options::addParameter(const std::string &key, const int &value, bool echo) {
  addParameter(key, std::vector<int>(1, value), echo);
}
void Options::addParameter(const std::string &key, const double &value, bool echo) {
  addParameter(key, std::vector<double>(1, value), echo);
}

} // namespace molpro
