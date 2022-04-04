## 1. Tutorials: 

- CMake Tutorial EP 1 | Understanding The Basics (youtube)

## 2. Knowledge

- Cmake is a (at least) two step process:
Cmake Command doc: https://cmake.org/cmake/help/latest/manual/cmake.1.html
- CMakeLists.txt is the top level config file for cmake, from there, you can create a project buildsystem by "cmake -S{sourceDir} -B{buildDir} <-DMAKE_BUILD_TYPE=Debug / Release>" and then build the project "cmake --build {buildDir}"
- Change a value with: cmake -D<Variable>=<Value>
- Sometimes, if you made some changes to CMakeLists.txt and doesn't get the right results, consider empty the {buildFolder} because some old config files could be causing error
Compile one file within a c++ project: not natively supported by cmake https://stackoverflow.com/questions/38271387/compile-a-single-file-under-cmake-project