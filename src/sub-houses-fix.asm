%include "macros/patch.inc"
%include "macros/hack.inc"
%include "vars/global.inc"

; On the score screen there's a check to see if you have a > 2 side, jump past it!
@HACK 0x0043DA29, SubHousesScoreFix
    jmp 0x0043DA41
@ENDHACK

; For playing a unit response, there's another check to see if your side is > 2, if so we should default it to 2 (Ordos)
@HACK 0x0049F25C, SubHousesPlayUnitResponseFix
    mov ebx,0x00000002
    jmp 0x0049f26E
@ENDHACK

; When interacting with the sidebar (i.e. building a unit), this only works if side is <= 2, so disable the if side == 2 check, so sides that are not 0 or 1 will use 2 (Ordos)
@CLEAR 0x0046F919, 0x90, 0x0046F91C ; SubHousesSidebarResponseFix
