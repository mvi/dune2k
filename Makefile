-include config.mk

IMPORT	= 1 0x4CF000 280
VSIZE	= .data 0x3F5AD4
OBJS	= \
src/hotkeys.o \
src/no-cd.o \
src/network-variables.o \
src/wol-fixes.o \
src/hotkeys-func.o \
src/mouse-wheel-and-buttons.o \
src/mouse-wheel-and-buttons-func.o \
res/dune2000.o
TARGET	= dune2000.exe

$(TARGET): $(OBJS) link vsize import patch dump

include generic.mk

NFLAGS	+= -Iinc/
CFLAGS	+= -Iinc/
LDFLAGS += -T res/dune2000.lds --file-alignment=0x400
