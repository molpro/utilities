# Source files at this level define the public interface to the library
LibraryManager_Append(${PROJECT_NAME}
        PUBLIC_HEADER iostream.h mpi.h cblas.h lapacke.h Options.h
        SOURCES iostream.cpp mpi.cpp Options.cpp
        )
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_11)
set_target_properties(${PROJECT_NAME} PROPERTIES CXX_EXTENSIONS OFF)
if (TARGET MPI::MPI_CXX)
    message(STATUS "molpro::utilities with MPI")
    target_link_libraries(${PROJECT_NAME} PUBLIC MPI::MPI_CXX)
    target_compile_definitions(${PROJECT_NAME} PRIVATE HAVE_MPI_H)
endif ()
if (TARGET GA::GA)
    message(STATUS "molpro::utilities with GA")
    target_link_libraries(${PROJECT_NAME} PUBLIC GA::GA)
    target_compile_definitions(${PROJECT_NAME} PRIVATE HAVE_GA_H)
endif ()
if (TARGET ppidd::ppidd)
    message(STATUS "molpro::utilities with PPIDD")
    target_link_libraries(${PROJECT_NAME} PUBLIC ppidd::ppidd)
    target_compile_definitions(${PROJECT_NAME} PRIVATE HAVE_PPIDD_H)
endif ()
