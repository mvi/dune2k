RM		?= rm -f
CC		?= gcc
CXX		?= g++
LD		?= ld
STRIP		?= strip
NASM		?= nasm
PETOOL		?= petool

WINDRES 	?= windres
CFLAGS		?= -std=gnu99 -Wall
CXXFLAGS	?= $(CFLAGS)
LDFLAGS		?= --allow-multiple-definition --enable-stdcall-fixup --subsystem=windows
WFLAGS		?=
NFLAGS		?= -f elf

include project.mk

.INTERMEDIATE: link import vsize patch strip dump
.NOTPARALLEL: link import vsize patch strip dump
.PHONY: clean

link:
	$(LD) $(LDFLAGS) -o $(TARGET) $(OBJS)

import:
	$(PETOOL) setdd $(TARGET) $(IMPORT)

vsize:
	$(PETOOL) setvs $(TARGET) $(VSIZE)

patch:
	-$(PETOOL) patch $(TARGET)

strip:
	$(STRIP) -R .patch $(TARGET)

dump:
	$(PETOOL) dump $(TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.asm
	$(NASM) $(NFLAGS) -o $@ $<

%.o: %.rc
	$(WINDRES) $(WFLAGS) $< $@

clean:
	$(RM) $(TARGET) $(OBJS)
