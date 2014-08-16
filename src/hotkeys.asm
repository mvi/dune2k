%include "macros/patch.inc"
%include "macros/hack.inc"

; this tells nasm that the C symbol (function) "HandleKeyEvent" is external of this file - linkers problem not ours to resolve it
extern _HandleKeyEvent

; two cdecl calls with two real arguments and should leave the original registers intact because we Save/Restore them via @CALLC

@CALLC 0x004A33A4, 0x4A33B0, 2, WM_KeyDown
    push 1
    push esi
    call _HandleKeyEvent
@ENDCALLC

@CALLC 0x004A3468, 0x4A346F, 2, WM_KeyUp
    push 0
    push eax
    call _HandleKeyEvent
@ENDCALLC

;remove checks for window mode (map scrolling)
@CLEAR 0x00443D3E, 0x90, 0x00443D44
@CLEAR 0x00443D49, 0x90, 0x00443D4D
@CLEAR 0x00443E26, 0x90, 0x00443E2C 
@CLEAR 0x00443E37, 0x90, 0x00443E3B
@CLEAR 0x00443E6A, 0x90, 0x00443E6E
@CLEAR 0x00443DC3, 0x90, 0x00443DC7

;map scroll down default hotkey
@SET 0x00443D4F, dd 0x00797eda
;map scroll up default hotkey
@SET 0x00443DC9, dd 0x00797edd
;map scroll right default hotkey
@SET 0x00443E3D, dd 0x00797edb
;map scroll left default hotkey
@SET 0x00443E70, dd 0x00797ed9
