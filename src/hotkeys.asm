%include "patch.inc"

@CLEAR 0x004A33A4, 0x90, 0x004A33B0
@LJMP 0x004A33A4, WM_KeyDown

@CLEAR 0x004A3468, 0x90, 0x004A346F
@LJMP 0x004A3468, WM_KeyUp

; this tells nasm that the C symbol (function) "HandleKeyEvent" is external of this file - linkers problem not ours to resolve it
extern _HandleKeyEvent

; two cdecl calls with two real arguments and should leave the original registers intact because we pop them back in
WM_KeyDown:
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
	jmp 0x4A33B0

WM_KeyUp:
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
	jmp 0x4A346F
