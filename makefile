# Build version
VERSION = 0

# Compiler and env set up
CC=gcc
CFLAGS  = -Wall -O0
OBJ = common.o commonfunc.o

# Rules
default: clean bin

bin: 
	$(CC) $(CFLAGS) -o common common.c commonfunc.c mathfunc.S -D_VERSION_=\"$(VERSION)\"

progc:
	$(CC) $(CFLAGS) -o common *.c -D_VERSION_=\"$(VERSION)\"

clean:
	$(RM) common
