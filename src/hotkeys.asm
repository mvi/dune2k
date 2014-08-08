%include "macros/patch.inc"
%include "macros/hack.inc"

; this tells nasm that the C symbol (function) "HandleKeyEvent" is external of this file - linkers problem not ours to resolve it
extern _HandleKeyEvent

; two cdecl calls with two real arguments and should leave the original registers intact because we pop them back in

@REPLACE 0x004A33A4, 0x4A33B0, WM_KeyDown
    push ecx
    push edx
    push eax
    push esi
    push 1
    push esi
    call _HandleKeyEvent
    add esp,8
    pop esi
    pop eax
    pop edx
    pop ecx
    jmp %$end
@ENDREPLACE

@REPLACE 0x004A3468, 0x4A346F, WM_KeyUp
    push esi
    push ecx
    push edx
    push eax
    push 0
    push eax
    call _HandleKeyEvent
    add esp,8
    pop eax
    pop edx
    pop ecx
    pop esi
    jmp %$end
@ENDREPLACE
