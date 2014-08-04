/* GNU ld linker script for res/dune2000.dat */
start = 0x4B2810;
ENTRY(start);
SECTIONS
{
    .text           0x401000   : { res/dune2000.dat(.text) }
    .rdata          0x4BE000   : { res/dune2000.dat(.rdata) }
    .data           0x4D9000   : { res/dune2000.dat(.data) }
    .idata          0x8CF000   : { res/dune2000.dat(.idata) }
    .rsrc           0x8D1000   : { res/dune2000.dat(.rsrc) }

    /DISCARD/                  : { *(.drectve) }

    .p_text                    : { *(.text); }
    .p_rdata                   : { *(.rdata); }
    .p_data                    : { *(.data) *(.bss) *(COMMON); }

    .patch                     : { *(.patch) }
}
