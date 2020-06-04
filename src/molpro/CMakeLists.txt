# Source files at this level define the public interface to the library
LibraryManager_Append(${PROJECT_NAME}
        PUBLIC_HEADER iostream.h
        SOURCES iostream.cpp
        )
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_11)
set_target_properties(${PROJECT_NAME} PROPERTIES CXX_EXTENSIONS OFF)
