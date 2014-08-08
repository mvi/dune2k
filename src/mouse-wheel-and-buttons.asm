%include "patch.inc"

@LJMP 0x004A3249, WM_MouseWheel
@LJMP 0x00444019, ScrollingUp
@LJMP 0x00443FD3, ScrollingDown

extern _HandleKeyEvent

%define UpArrowKeyIsDown1 0x26+0x797E78
%define UpArrowKeyIsDown2 0x26+0x798390
%define DownArrowKeyIsDown1 0x28+0x797E78
%define DownArrowKeyIsDown2 0x28+0x798390

%define VK_MBUTTON 0x04
%define VK_XBUTTON1 0x05
;%define VK_XBUTTON2 0x06

[section .idata]
	MouseWheelTriggered db 0


[section .text]

WM_MouseWheel:
	cmp esi,0x20A
	jnz WM_MButtonDown
	mov byte [MouseWheelTriggered],1
	ror ecx,0x10
	cmp cl,0x78 ;MouseWheel Up 0x00780000
	ror ecx,0x10
	jnz .MouseWheelDown
	mov byte [UpArrowKeyIsDown1],1
	mov byte [UpArrowKeyIsDown2],1
	jmp TheEnd
	
.MouseWheelDown: ;MouseWheel Down 0xFF880000
	mov byte [DownArrowKeyIsDown1],1
	mov byte [DownArrowKeyIsDown2],1
	jmp TheEnd
	
	
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

	
WM_MButtonDown:
	cmp esi,0x0207
	jnz .WM_MButtonUp
	push ecx 
	push edx
	push eax
	push esi
	push 1
	push VK_MBUTTON
	call _HandleKeyEvent
	add esp,8
	pop esi
	pop eax
	pop edx
	pop ecx
	jnz TheEnd
	
.WM_MButtonUp:
	cmp esi,0x0208
	jnz .WM_XButtonDown
	push ecx 
	push edx
	push eax
	push esi
	push 0
	push VK_MBUTTON
	call _HandleKeyEvent
	add esp,8
	pop esi
	pop eax
	pop edx
	pop ecx
	jnz TheEnd
	
.WM_XButtonDown:
	cmp esi,0x020B
	jnz .WM_XButtonUp
	push ecx 
	push edx
	push eax
	push esi
	push 1
	push VK_XBUTTON1
	call _HandleKeyEvent
	add esp,8
	pop esi
	pop eax
	pop edx
	pop ecx
	jnz TheEnd
	
.WM_XButtonUp:
	cmp esi,0x020C
	jnz TheEnd
	push ecx 
	push edx
	push eax
	push esi
	push 0
	push VK_XBUTTON1
	call _HandleKeyEvent
	add esp,8
	pop esi
	pop eax
	pop edx
	pop ecx
	jnz TheEnd

TheEnd:
	cmp esi,0x14
	ja 0x004A328F
	jmp 0x004A324E
