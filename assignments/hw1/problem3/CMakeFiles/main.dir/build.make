# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cakeng/builds/graphics_programming/assignments/hw1/problem3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cakeng/builds/graphics_programming/assignments/hw1/problem3

# Include any dependencies generated for this target.
include CMakeFiles/main.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main.dir/flags.make

CMakeFiles/main.dir/src/main.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/main.cpp.o: src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cakeng/builds/graphics_programming/assignments/hw1/problem3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/main.dir/src/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/main.cpp.o -c /home/cakeng/builds/graphics_programming/assignments/hw1/problem3/src/main.cpp

CMakeFiles/main.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cakeng/builds/graphics_programming/assignments/hw1/problem3/src/main.cpp > CMakeFiles/main.dir/src/main.cpp.i

CMakeFiles/main.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cakeng/builds/graphics_programming/assignments/hw1/problem3/src/main.cpp -o CMakeFiles/main.dir/src/main.cpp.s

CMakeFiles/main.dir/src/text_renderer.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/text_renderer.cpp.o: src/text_renderer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cakeng/builds/graphics_programming/assignments/hw1/problem3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/main.dir/src/text_renderer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/text_renderer.cpp.o -c /home/cakeng/builds/graphics_programming/assignments/hw1/problem3/src/text_renderer.cpp

CMakeFiles/main.dir/src/text_renderer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/text_renderer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cakeng/builds/graphics_programming/assignments/hw1/problem3/src/text_renderer.cpp > CMakeFiles/main.dir/src/text_renderer.cpp.i

CMakeFiles/main.dir/src/text_renderer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/text_renderer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cakeng/builds/graphics_programming/assignments/hw1/problem3/src/text_renderer.cpp -o CMakeFiles/main.dir/src/text_renderer.cpp.s

CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.o: /home/cakeng/builds/graphics_programming/assignments/glad.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cakeng/builds/graphics_programming/assignments/hw1/problem3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.o   -c /home/cakeng/builds/graphics_programming/assignments/glad.c

CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cakeng/builds/graphics_programming/assignments/glad.c > CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.i

CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cakeng/builds/graphics_programming/assignments/glad.c -o CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.s

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/src/main.cpp.o" \
"CMakeFiles/main.dir/src/text_renderer.cpp.o" \
"CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

build/main: CMakeFiles/main.dir/src/main.cpp.o
build/main: CMakeFiles/main.dir/src/text_renderer.cpp.o
build/main: CMakeFiles/main.dir/home/cakeng/builds/graphics_programming/assignments/glad.c.o
build/main: CMakeFiles/main.dir/build.make
build/main: CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cakeng/builds/graphics_programming/assignments/hw1/problem3/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable build/main"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main.dir/build: build/main

.PHONY : CMakeFiles/main.dir/build

CMakeFiles/main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main.dir/clean

CMakeFiles/main.dir/depend:
	cd /home/cakeng/builds/graphics_programming/assignments/hw1/problem3 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cakeng/builds/graphics_programming/assignments/hw1/problem3 /home/cakeng/builds/graphics_programming/assignments/hw1/problem3 /home/cakeng/builds/graphics_programming/assignments/hw1/problem3 /home/cakeng/builds/graphics_programming/assignments/hw1/problem3 /home/cakeng/builds/graphics_programming/assignments/hw1/problem3/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/main.dir/depend

