%include "macros/patch.inc"

@CLEAR 0x0045A983, 0x90, 0x0045A9C1
@LJMP 0x0045A983, LAN_Settings

@CLEAR 0x0045A9C1, 0x90, 0x0045A9FA
@LJMP 0x0045A9C1, WOL_Settings

@LJMP 0x00413EBE, CustomWOLGameVersion1
@CLEAR 0x0041A28C, 0x90, 0x0041A293
@LJMP 0x0041A28C, CustomWOLGameVersion2

;Default handicap setting for multiplayer
@SET 0x00470834, db 0x00


%define SendRate 0x4E3AEC
%define ReconnectTimeOutToPlayer 0x6B9460
%define InitialConnectTimeOut 0x6B9644
%define UnknownNetVar1 0x6B93E8
%define UnknownNetVar2 0x4E3AE8
%define UnknownNetVar3 0x4E3B1C
%define UnknownNetVar4 0x4E3AF0
%define UnknownNetVar5 0x4E3AF4

%define WOLGameVersion 3


[section .text]

LAN_Settings:
	mov dword [InitialConnectTimeOut],15000
	mov dword [ReconnectTimeOutToPlayer],6
	mov dword [SendRate],150
	mov dword [UnknownNetVar1],180
	mov dword [UnknownNetVar2],40
	mov dword [UnknownNetVar3],300
	mov dword [UnknownNetVar4],1500
	mov dword [UnknownNetVar5],0x40066666
	jmp 0x0045AA2C

	
WOL_Settings:
	mov dword [InitialConnectTimeOut],15000
	mov dword [ReconnectTimeOutToPlayer],30
	mov dword [SendRate],300
	mov dword [UnknownNetVar1],300
	mov dword [UnknownNetVar2],75
	mov dword [UnknownNetVar3],1000
	mov dword [UnknownNetVar4],1500
	mov dword [UnknownNetVar5],0x40000000
	jmp 0x0045AA2C

	
CustomWOLGameVersion1:
	cmp eax, WOLGameVersion
	je 0x00413F0A
	jmp 0x00413EC3

	
CustomWOLGameVersion2:
	or ecx,0xFFFFFFFF
	xor eax,eax
	push WOLGameVersion
	jmp 0x0041A293
