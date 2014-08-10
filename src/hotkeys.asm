%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/registers.inc"

; this tells nasm that the C symbol (function) "HandleKeyEvent" is external of this file - linkers problem not ours to resolve it
extern _HandleKeyEvent

; two cdecl calls with two real arguments and should leave the original registers intact because we Save/Restore them

@REPLACE 0x004A33A4, 0x4A33B0, WM_KeyDown
	SaveRegisters
    push 1
    push esi
    call _HandleKeyEvent
	RestoreRegisters 2
    jmp %$end
@ENDREPLACE

@REPLACE 0x004A3468, 0x4A346F, WM_KeyUp
	SaveRegisters
    push 0
    push eax
    call _HandleKeyEvent
	RestoreRegisters 2
    jmp %$end
@ENDREPLACE
