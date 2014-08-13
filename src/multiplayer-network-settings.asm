%include "macros/patch.inc"
%include "macros/hack.inc"
%include "vars/global.inc"

%assign WOLGameVersion 3

@REPLACE 0x0045A983, 0x0045A9C1, LAN_Settings
    mov  dword [_InitialConnectTimeOut],15000
    mov  dword [_ReconnectTimeOutToPlayer],6
    mov  dword [_SendRate],150
    mov  dword [_UnknownNetVar1],180
    mov  dword [_UnknownNetVar2],40
    mov  dword [_UnknownNetVar3],300
    mov  dword [_UnknownNetVar4],1500
    mov  dword [_UnknownNetVar5],0x40066666
    jmp  0x0045AA2C ; not %$end on purpose!
@ENDREPLACE


@REPLACE 0x0045A9C1, 0x0045A9FA, WOL_Settings
    mov  dword [_InitialConnectTimeOut],15000
    mov  dword [_ReconnectTimeOutToPlayer],30
    mov  dword [_SendRate],300
    mov  dword [_UnknownNetVar1],300
    mov  dword [_UnknownNetVar2],75
    mov  dword [_UnknownNetVar3],1000
    mov  dword [_UnknownNetVar4],1500
    mov  dword [_UnknownNetVar5],0x40000000
    jmp  0x0045AA2C ; not %$end on purpose!
@ENDREPLACE


@CLEAR 0x0041A28C, 0x90, 0x0041A293

@HACK 0x00413EBE, CustomWOLGameVersion1
    cmp  eax, WOLGameVersion
    je   0x00413F0A
    jmp  0x00413EC3
@ENDHACK

@HACK 0x0041A28C, CustomWOLGameVersion2
    or   ecx,0xFFFFFFFF
    xor  eax,eax
    push WOLGameVersion
    jmp  0x0041A293
@ENDHACK
