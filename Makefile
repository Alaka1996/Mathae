CC = gcc
CFLAGS = -Iinclude -Wall
SRC = src/main.c
TARGET = main

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -f $(TARGET)
