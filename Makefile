-include config.mk

GAME        = dune2000

COMMON_DIR  = common

LSCRIPT     = patch.lds
INBIN       = $(GAME).dat
ALIGNMENT   = 0x0400

IMPORT      = 1 0x4CF000 280
VSIZE       = .data 0x3F5AD4


INCLUDES    = -Iinc/ -I$(COMMON_DIR)/inc/

LIBS        =
OBJS        = callsites.o \
		\
		src/high-res.o \
		src/high-res-func.o \
		src/command-line-parameters.o \
		src/hotkeys.o \
		src/no-cd.o \
		src/multiplayer-network-settings.o \
		src/wol-fixes.o \
		src/hotkeys-func.o \
		src/mouse-wheel-and-buttons.o \
		src/mouse-wheel-and-buttons-func.o \
		src/dune2000.ini.o \
		src/show-in-game-mes-longer.o \
		res/dune2000.o \
		utils/stdio.o \
		utils/helpers.o \
		utils/ini-file.o \
		version.o \
		\
		sym.o

PURE_OBJS   = sym.o res/dune2000.o

default: $(GAME).exe

$(GAME).exe: .dump-.patch-.import-.$(GAME).exe
	$(CP) $< $@

pure-$(GAME).exe: .dump-.import-.pure-$(GAME).exe
	$(CP) $< $@

include $(COMMON_DIR)/generic.mk

CFLAGS	   += -D_MSVCRT_
WFLAGS	   += -Ires/ -I$(COMMON_DIR)/res/
