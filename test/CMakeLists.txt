include(FetchContent)
set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)
FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG "release-1.11.0"
)
FetchContent_MakeAvailable(googletest)

include(GoogleTest)
foreach (t test-iostream test-mpi test-options test-blas test-lapacke)
    add_executable(${t} ${t}.cpp)
    set_property(TARGET ${t} PROPERTY CXX_STANDARD 17)
    target_link_libraries(${t} PUBLIC gmock_main molpro::${PROJECT_NAME})
    if (NOT CMAKE_CROSSCOMPILING)
        gtest_discover_tests(${t})
        add_test(${t} ${t})
    endif ()
endforeach ()
target_sources(test-iostream PRIVATE xout.cpp)
target_compile_definitions(test-iostream PRIVATE EXTERN_OSTREAM_COUT=xout)

add_library(libtestblas INTERFACE)
LibraryManager_BLAS(libtestblas INTERFACE )
LibraryManager_LAPACK(libtestblas INTERFACE OpenBLAS)
target_link_libraries(test-blas PRIVATE BLAS::BLAS)
target_link_libraries(test-lapacke PRIVATE LAPACK::LAPACK)
include(LibraryManagerUtils)
print_target_properties(BLAS::BLAS)
print_target_properties(LAPACK::LAPACK)
