# Top level directory of the source tree

# There should be at least one library.
set(NameSpace "molpro")
LibraryManager_Add(${PROJECT_NAME} NAMESPACE ${NameSpace})

if (MPI)
    find_package(MPI REQUIRED COMPONENTS CXX)
endif ()

# Its source files are conventionally in directories named by C++ namespace
add_subdirectory(molpro)

LibraryManager_Install(${PROJECT_NAME} PKG_CONFIG)
LibraryManager_Export(${PROJECT_NAME} NAMESPACE ${NameSpace})
