# Compiler and Flags
CC = g++
CFLAGS = -Iinclude -Wall -Wextra -Werror -std=c++11

# Source and Object Files
SRC = src/main.c src/sensor.c src/utils.c
OBJ = $(SRC:.c=.o)
TEST_SRC = tests/test_buffer.cpp
TEST_OBJ = $(TEST_SRC:.cpp=.o)

# Directories
GTEST_DIR = googletest/googletest
GTEST_FLAGS = -I$(GTEST_DIR)/include -pthread

# Targets
TARGET = main
TEST_TARGET = test

# Build Rules
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

test: $(TEST_OBJ)
	$(CC) $(TEST_OBJ) $(GTEST_DIR)/src/gtest_main.cc $(GTEST_DIR)/src/gtest-all.cc -o $(TEST_TARGET) $(GTEST_FLAGS)

run-tests: test
	./$(TEST_TARGET)

# Static Code Analysis (CppCheck)
cppcheck:
	# Run cppcheck on the src and include directories
	# --enable=all: Enable all checks
	# --inconclusive: Allows inconclusive results
	# --xml: Outputs results in XML format
	# --xml-version=2: Specifies XML version
	# --quiet: Suppresses most non-error output
	# --error-exitcode=1: Make cppcheck fail the build if it finds errors
	cppcheck --enable=all --inconclusive --xml --xml-version=2 --quiet --error-exitcode=1 src include

# Run the Static Analysis before the Build (Optional)
check: cppcheck

# Clean Build Artifacts
clean:
	rm -f $(OBJ) $(TARGET) $(TEST_OBJ) $(TEST_TARGET)
