%include "patch.inc"

@LJMP 0x004A3249, WM_MouseHWheel
@LJMP 0x00444019, ScrollingUp
@LJMP 0x00443FD3, ScrollingDown

%define UpArrow_Key 0x26
%define DownArrow_Key 0x28

[section .idata]
	MouseWheelTriggered db 0


[section .text]

WM_MouseHWheel:
	cmp esi,0x20A
	jnz .out
	mov byte [MouseWheelTriggered],1
	cmp ecx,0x00780000 ;MouseWheel Up
	jnz .MouseWheelDown
	mov byte [UpArrow_Key+0x797E78],1
	mov byte [UpArrow_Key+0x798390],1
	jmp .out
	
.MouseWheelDown ;MouseWheel Down 0xFF880000
	mov byte [DownArrow_Key+0x797E78],1
	mov byte [DownArrow_Key+0x798390],1
	jmp .out

.out:
	cmp esi,0x14
	ja 0x004A328F
	jmp 0x004A324E
	
	
ScrollingUp:
	mov eax,dword [0x516440]
	cmp byte [MouseWheelTriggered],1
	jnz 0x0044401E
	mov byte [UpArrow_Key+0x797E78],0
	mov byte [MouseWheelTriggered],0
	jmp 0x0044401E


ScrollingDown:
	mov eax,dword [0x516440]
	cmp byte [MouseWheelTriggered],1
	jnz 0x00443FD8
	mov byte [DownArrow_Key+0x797E78],0
	mov byte [MouseWheelTriggered],0
	jmp 0x00443FD8
