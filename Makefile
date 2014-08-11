-include config.mk

GAME        = dune2000

LSCRIPT     = $(GAME).lds
INBIN       = $(GAME).dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x4CF000 280
VSIZE       = .data 0x3F5AD4

INCLUDES    = -Iinc/ -Icommon/inc/

OBJS        = callsites.o \
		\
		src/hotkeys.o \
		src/no-cd.o \
		src/multiplayer-network-settings.o \
		src/wol-fixes.o \
		src/hotkeys-func.o \
		src/mouse-wheel-and-buttons.o \
		src/mouse-wheel-and-buttons-func.o \
		src/dune2000.ini.o \
		src/ini-file.o \
		res/dune2000.o \
		\
		sym.o

default: $(GAME).exe

$(GAME).exe: dump-exe/patch/import/vsize/link-exe

include common/generic.mk

WFLAGS	   += -Ires/ -Icommon/res/
LDFLAGS    += -nostdlib
