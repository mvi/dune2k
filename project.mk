IMPORT	= 1 0x4CF000 280
VSIZE	= .data 0x3F5AD4
OBJS	= src/hotkeys.o src/no-cd.o src/network-variables.o res/dune2000.o
TARGET	= dune2000.exe
NFLAGS	+= -Iinc/
CFLAGS	+= -Iinc/
LDFLAGS += -T res/dune2000.lds --file-alignment=0x400

-include config.mk

$(TARGET): $(OBJS) link vsize import patch dump
