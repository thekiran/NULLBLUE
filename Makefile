CC=gcc
CFLAGS=-Wall -Wextra -std=c11 -Iinclude
SRC=$(shell find src -name "*.c")
OUT=out/nullblue

all:
	@mkdir -p out
	$(CC) $(CFLAGS) $(SRC) -o $(OUT)

clean:
	rm -rf out

run: all
	./$(OUT)
