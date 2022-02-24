cmake_minimum_required(VERSION 3.15)
project(utilities CXX)

include(FetchContent)
FetchContent_Declare(
        LibraryManager
        GIT_REPOSITORY https://gitlab+deploy-token-178345:RQZa2rmdwnV7Hdwg8XEq@gitlab.com/molpro/LibraryManager.git
        GIT_TAG 0.9.1
)
FetchContent_MakeAvailable(LibraryManager)
LibraryManager_Project()

add_subdirectory(dependencies)

add_subdirectory(src)

if (${CMAKE_PROJECT_NAME} STREQUAL ${PROJECT_NAME})
#    add_subdirectory(examples)
    enable_testing()
    add_subdirectory(test)
endif ()

# Documentation has to come last to make sure all dependencies have been added
include(DependencyManagerDocs)

DependencyManagerDocs_Add(${PROJECT_NAME}
        FILES README.md
        DOC_URL "https://molpro.gitlab.io/utilities/${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}"
        )
