%include "patch.inc"

@LJMP 0x004A3249, WindowMessage
@LJMP 0x00444019, WheelScrollingUp
@LJMP 0x00443FD3, WheelScrollingDown

extern _HandleWindowMessage
extern _MouseWheelTriggered

%define UpArrowKeyIsDown1 0x26+0x797E78
%define DownArrowKeyIsDown1 0x28+0x797E78

WindowMessage:
	push ecx 
	push edx
	push eax
	push esi
	push ecx
	push esi
	call _HandleWindowMessage
	add esp,8
	pop esi
	pop eax
	pop edx
	pop ecx
	cmp esi,0x14
	ja 0x004A328F
	jmp 0x004A324E
	

WheelScrollingUp:
	mov eax,dword [0x516440]
	cmp byte [_MouseWheelTriggered],1
	jnz 0x0044401E
	mov byte [UpArrowKeyIsDown1],0
	mov byte [_MouseWheelTriggered],0
	jmp 0x0044401E


WheelScrollingDown:
	mov eax,dword [0x516440]
	cmp byte [_MouseWheelTriggered],1
	jnz 0x00443FD8
	mov byte [DownArrowKeyIsDown1],0
	mov byte [_MouseWheelTriggered],0
	jmp 0x00443FD8
