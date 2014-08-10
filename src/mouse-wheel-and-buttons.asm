%include "macros/patch.inc"
%include "macros/hack.inc"
%include "vars/keymap.inc"

extern _HandleWindowMessage
extern _MouseWheelTriggered


@CALLC 0x004A3249, 0x004A324E, WindowMessage
    push ecx
    push esi
    call _HandleWindowMessage
@FINISHCALLC 2
    cmp  esi,0x14
    ja   0x004A328F
@ENDCALLC


@HACK 0x00444019, WheelScrollingUp
    mov  eax,dword [0x516440]
    cmp  byte [_MouseWheelTriggered],1
    jnz  0x0044401E
    mov  byte [KeyIsDown2(VK_UP)],0
    mov  byte [_MouseWheelTriggered],0
    jmp  0x0044401E
@ENDHACK

@HACK 0x00443FD3, WheelScrollingDown
    mov  eax,dword [0x516440]
    cmp  byte [_MouseWheelTriggered],1
    jnz  0x00443FD8
    mov  byte [KeyIsDown2(VK_DOWN)],0
    mov  byte [_MouseWheelTriggered],0
    jmp  0x00443FD8
@ENDHACK
