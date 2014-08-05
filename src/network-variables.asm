%include "patch.inc"

@CLEAR 0x0045A983, 0x90, 0x0045A9C1
@LJMP 0x0045A983, _LAN_Settings

@CLEAR 0x0045A9C1, 0x90, 0x0045A9FA
@LJMP 0x0045A9C1, _WOL_Settings

@LJMP 0x00413EBE, _WOL_GameVersion1
@CLEAR 0x0041A28C, 0x90, 0x0041A293
@LJMP 0x0041A28C, _WOL_GameVersion2


%define SendRate 0x4E3AEC
%define ReconnectTimeOutToPlayer 0x6B9460
%define InitialConnectTimeOut 0x6B9644
%define UnknownNetVar1 0x6B93E8
%define UnknownNetVar2 0x4E3AE8
%define UnknownNetVar3 0x4E3B1C
%define UnknownNetVar4 0x4E3AF0
%define UnknownNetVar5 0x4E3AF4

%define WOLGameVersion 0x3


[section .text]

_LAN_Settings:

mov dword [InitialConnectTimeOut],0x3A98
mov dword [ReconnectTimeOutToPlayer],0x6
mov dword [SendRate],0x96
mov dword [UnknownNetVar1],0x0B4
mov dword [UnknownNetVar2],0x28
mov dword [UnknownNetVar3],0x12C
mov dword [UnknownNetVar4],0x5DC
mov dword [UnknownNetVar5],0x40066666
jmp 0x0045AA2C


_WOL_Settings:

mov dword [InitialConnectTimeOut],0x3A98
mov dword [ReconnectTimeOutToPlayer],0x1E
mov dword [SendRate],0x12C
mov dword [UnknownNetVar1],0x12C
mov dword [UnknownNetVar2],0x4B
mov dword [UnknownNetVar3],0x3E8
mov dword [UnknownNetVar4],0x5DC
mov dword [UnknownNetVar5],0x40000000
jmp 0x0045AA2C


_WOL_GameVersion1:

cmp eax, WOLGameVersion
je 0x00413F0A
jmp 0x00413EC3


_WOL_GameVersion2:

or ecx,0xFFFFFFFF
xor eax,eax
push WOLGameVersion
jmp 0x0041A293
