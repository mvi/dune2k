%include "macros/patch.inc"
%include "macros/hack.inc"

; this tells nasm that the C symbol (function) "HandleKeyEvent" is external of this file - linkers problem not ours to resolve it
extern _HandleKeyEvent

; two cdecl calls with two real arguments and should leave the original registers intact because we Save/Restore them via @CALLC

@CALLC 0x004A33A4, 0x4A33B0, WM_KeyDown
    push 1
    push esi
    call _HandleKeyEvent
@FINISHCALLC 2
@ENDCALLC

@CALLC 0x004A3468, 0x4A346F, WM_KeyUp
    push 0
    push eax
    call _HandleKeyEvent
@FINISHCALLC 2
@ENDCALLC