cmake_minimum_required(VERSION 3.15)
project(utilities CXX)

include(FetchContent)
FetchContent_Declare(
        LibraryManager
        GIT_REPOSITORY https://github.com/molpro/library-manager.git
        GIT_TAG 0.13.2
)
FetchContent_MakeAvailable(LibraryManager)
LibraryManager_Project(MPI_OPTION)

add_subdirectory(dependencies)

add_subdirectory(src)

if (${CMAKE_PROJECT_NAME} STREQUAL ${PROJECT_NAME})
#    add_subdirectory(examples)
    enable_testing()
    add_subdirectory(test)
endif ()

# Documentation has to come last to make sure all dependencies have been added
include(DependencyManagerDocs OPTIONAL RESULT_VARIABLE DependencyManagerDocs_FOUND)

if (NOT DependencyManagerDocs_FOUND STREQUAL "NOTFOUND")
    DependencyManagerDocs_Add(${PROJECT_NAME}
            FILES README.md
            DOC_URL "https://molpro.github.io/utilities/${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}"
            )
endif()