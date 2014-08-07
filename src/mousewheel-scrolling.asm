%include "patch.inc"

@LJMP 0x004A3249, WM_MouseWheel
@LJMP 0x00444019, ScrollingUp
@LJMP 0x00443FD3, ScrollingDown

%define UpArrowKeyIsDown1 0x26+0x797E78
%define UpArrowKeyIsDown2 0x26+0x798390
%define DownArrowKeyIsDown1 0x28+0x797E78
%define DownArrowKeyIsDown2 0x28+0x798390

[section .idata]
	MouseWheelTriggered db 0


[section .text]

WM_MouseWheel:
	cmp esi,0x20A
	jnz .out
	mov byte [MouseWheelTriggered],1
	ror ecx,0x10
	cmp cl,0x78 ;MouseWheel Up 0x00780000
	ror ecx,0x10
	jnz .MouseWheelDown
	mov byte [UpArrowKeyIsDown1],1
	mov byte [UpArrowKeyIsDown2],1
	jmp .out
	
.MouseWheelDown: ;MouseWheel Down 0xFF880000
	mov byte [DownArrowKeyIsDown1],1
	mov byte [DownArrowKeyIsDown2],1
	jmp .out

.out:
	cmp esi,0x14
	ja 0x004A328F
	jmp 0x004A324E
	
	
ScrollingUp:
	mov eax,dword [0x516440]
	cmp byte [MouseWheelTriggered],1
	jnz 0x0044401E
	mov byte [UpArrowKeyIsDown1],0
	mov byte [MouseWheelTriggered],0
	jmp 0x0044401E


ScrollingDown:
	mov eax,dword [0x516440]
	cmp byte [MouseWheelTriggered],1
	jnz 0x00443FD8
	mov byte [DownArrowKeyIsDown1],0
	mov byte [MouseWheelTriggered],0
	jmp 0x00443FD8
