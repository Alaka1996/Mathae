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

# Clean Build Artifacts
clean:
	rm -f $(OBJ) $(TARGET) $(TEST_OBJ) $(TEST_TARGET)
