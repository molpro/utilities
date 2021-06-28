#ifndef MOLPRO_OPTIONS_H
#define MOLPRO_OPTIONS_H
#include <fstream>
#include <string>
#include <vector>
/*!
 * \brief Class that manages input options
 */
namespace molpro {
class Options {
public:
  /*!
   * \brief Construct Options object
   * \param input Namelist format option specifier
   * \param program Name of code module owning this set of options. In the Molpro context, this is the registry set.
   */
  explicit Options(std::string program, std::string input = "");

  explicit Options(std::string program, int argc, const char* argv[]);

  /*!
   * \brief Obtain an integer parameter.
   * \param key The name of the parameter
   * \param def Default value if the parameter is not found.
   * \return  The result as a vector of integers.
   */
  std::vector<int> parameter(const std::string &key, const std::vector<int> &def) const;
  int parameter(const std::string &key, int def = 0) const;

  /*!
   * \brief Obtain a real parameter.
   * \param key The name of the parameter
   * \param def Default value if the parameter is not found.
   * \return  The result as a vector of integers.
   */
  std::vector<double> parameter(const std::string &key, const std::vector<double> &def) const;
  double parameter(const std::string &key, double def) const;

  /*!
   * \brief Obtain a string parameter.
   * \param key The name of the parameter
   * \param def Default value if the parameter is not found.
   * \return  The result as a vector of integers.
   */
  std::vector<std::string> parameter(const std::string &key, const std::vector<std::string> &def) const;
  std::string parameter(const std::string &key, const std::string &def) const;

  /*!
   * \brief Add a parameter with array values
   * \param key key
   * \param values values
   * \param echo whether to print the parameter and value
   */
  void addParameter(const std::string &key, const std::vector<std::string> &values, bool echo = false);

  /*!
   * \brief Add a parameter with array values
   * \param key key
   * \param values values
   * \param echo whether to print the parameter and value
   */
  void addParameter(const std::string &key, const std::vector<int> &values, bool echo = false);

  /*!
   * \brief Add a parameter with array values
   * \param key key
   * \param values values
   * \param echo whether to print the parameter and value
   */
  void addParameter(const std::string &key, const std::vector<double> &values, bool echo = false);

  /*!
   * \brief Add a parameter with a scalar value
   * \param key key
   * \param value value
   * \param echo whether to print the parameter and value
   */
  void addParameter(const std::string &key, const std::string &value, bool echo = false);

  /*!
   * \brief Add a parameter with a scalar value
   * \param key key
   * \param value value
   * \param echo whether to print the parameter and value
   */
  void addParameter(const std::string &key, const int &value, bool echo = false);

  /*!
   * \brief Add a parameter with a scalar value
   * \param key key
   * \param value value
   * \param echo whether to print the parameter and value
   */
  void addParameter(const std::string &key, const double &value, bool echo = false);

  std::string data() const { return namelistData; }

private:
  std::string namelistData;
  std::string m_program;
};
} // namespace molpro

#endif // MOLPRO_OPTIONS_H
