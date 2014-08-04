IMPORT	= 1 0x4CF000 280
VSIZE	= .data 0x3F5AD4
OBJS	= src/hotkeys.o
TARGET	= dune2000.exe
NFLAGS	+= -Iinc/
CFLAGS	+= -Iinc/
LDFLAGS += -T res/dune2000.lds

-include config.mk

$(TARGET): $(OBJS) link vsize import patch strip dump
