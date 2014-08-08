-include config.mk

GAME        = dune2000

LSCRIPT     = $(GAME).lds
INBIN       = $(GAME).dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x4CF000 280
VSIZE       = .data 0x3F5AD4


INCLUDES    = -Iinc/

LIBS        = -nostdlib
OBJS        = callsites.o \
		\
		src/hotkeys.o \
		src/no-cd.o \
		src/network-variables.o \
		src/wol-fixes.o \
		src/hotkeys-func.o \
		src/mouse-wheel-and-buttons.o \
		src/mouse-wheel-and-buttons-func.o \
		res/dune2000.o \
		\
		sym.o

DLL_LIBS    = -lmsvcrt
DLL_OBJS    = $(OBJS)

default: $(GAME).exe $(GAME).dll

$(GAME).exe: link/dump/patch/import/vsize/$(GAME).exe

$(GAME).dll: link/dump/$(GAME).dll

include generic.mk

WFLAGS	   += -Ires/
