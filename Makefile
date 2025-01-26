CC = gcc
CFLAGS = -Iinclude -Wall -Wextra -Werror -fsanitize=address -g
SRC = src/main.c
TARGET = main

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -f $(TARGET)
