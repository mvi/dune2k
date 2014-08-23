%include "macros/patch.inc"
%include "macros/hack.inc"
%include "vars/global.inc"


;@CLEAR 0x004A3CE5, 0x90, 0x004A3CE8 ; window mode fix, just needed for testing

; ### TODO ###
;fix sp (center anim score/mission select)
;map too small crash
;airstrike OOS
;center videos
;fix multiplayer chat

extern _UilCenterExceptCheck
extern _ControlCenterExceptCheck
extern _DrawEmptySideBarIcons


@CALLC 0x0044916C, 0x00449172, 2, SideBarStartportDrawingGlitchFix
	push dword[0x6D60D0]
	push dword[0x5178B4]
	call _DrawEmptySideBarIcons
@FINISHCALLC
	mov ecx, dword[0x5178B4]
@ENDCALLC


@CALLC 0x00449145, 0x0044914B, 2, SideBarUpgradeDrawingGlitchFix
	push dword[0x6D60D0]
	push dword[0x5178B4]
	call _DrawEmptySideBarIcons
@FINISHCALLC
	mov edx, dword[0x5178B4]
@ENDCALLC


@REPLACE 0x00472142, 0x000472147, MenuToolTipFixWidth
	cmp byte[_HighResPatchEnabled], 1
	jnz .out
	cmp eax, dword[_GameWidth]
	jmp 0x00472147
.out:
	cmp eax, 0x280
	jmp 0x00472147
@ENDREPLACE


@REPLACE 0x00472153, 0x00472159, MenuToolTipFixHeight
	cmp byte[_HighResPatchEnabled], 1
	jnz .out
	cmp ecx, dword[_GameHeight]
	jmp 0x00472159
.out:
	cmp ecx, 0x190
	jmp 0x00472159
@ENDREPLACE


;load custom uibb files
@SET 0x00460D23, dd _uibb_r16FileName
@SET 0x00460D37, dd _uibb_r16FileName
@SET 0x00460E3D, dd _uibb_r16FileName
@SET 0x00460D3E, dd _uibb_r8FileName
@SET 0x00460D52, dd _uibb_r8FileName
@SET 0x00460E4B, dd _uibb_r8FileName


@REPLACE 0x0042CD30, 0x0042CD37, TemporaryDisableSPAnim
	cmp byte[_HighResPatchEnabled], 1
	jnz .out
	retn
.out:
	sub esp, 0x18
	mov ecx, dword[esp+0x24]
	jmp 0x0042CD37
@ENDREPLACE


@CALLC 0x00436056, 0x0043605E, 1, UilCenterExcept
	push eax
    call _UilCenterExceptCheck
@FINISHCALLC
	push eax
	mov ecx, ebp
	call 0x004390E0
@ENDCALLC


@CALLC 0x00436036, 0x0043603C, 1, UilCenterExcept2
	push eax
    call _UilCenterExceptCheck
@FINISHCALLC
	push eax
	call 0x004390E0
@ENDCALLC


@CALLC 0x004391D7, 0x004391DE, 1, ControlCenterOnlyOnce
	push edx
    call _ControlCenterExceptCheck
@FINISHCALLC
	push 0x0A
	push 0x004DF3C4
@ENDCALLC


@CLEAR 0x004827D8, 0x90, 0x004827E6
@HACK 0x004827D8, CenterUI
	mov ecx, dword[esp+0x1C]
	cmp byte[_HighResPatchEnabled], 1
	jnz .out
	cmp byte[_HighResCenterUI], 1
	jnz .out
	cmp byte[_HighResUilCenterExcept], 1
	jz .out
	cmp byte[_HighResControlCenterExcept], 1
	jnz .align
	cmp byte[_HighResControlFirstTimeCenter], 1
	jnz .out
.align:
	add edx, dword[_HighResUIAlignY]
	add ecx, dword[_HighResUIAlignX]
	mov byte[_HighResControlFirstTimeCenter], 0
.out:
	mov dword[ebp+0x0C], edx
	mov edx, dword[esp+0x2C]
	mov dword[ebp+0x8], ecx
	jmp 0x004827E6
@ENDHACK


@CLEAR 0x00460FD3, 0x90, 0x00460FD8
@HACK 0x00460FD3, AdjustGUIxUI_LANG_r
	cmp byte[_HighResPatchEnabled], 1
	jnz .out
	cmp dword[eax], 320
	jbe .out
	mov ecx, dword[_HighResAddedWidth]
	add dword[eax], ecx
.out:
	mov ecx, dword[eax]
	add eax,4
	jmp 0x00460FD8
@ENDHACK


@HACK 0x00460FDF, AdjustGUIyUI_LANG_r
	cmp byte[_HighResPatchEnabled], 1
	jnz .out
	cmp dword[eax], 200
	jbe .out
	mov edx, dword[_HighResAddedHeight]
	add dword[eax], edx
.out:
	mov edx, dword[eax]
	add eax,4
	jmp 0x00460FE4
@ENDHACK


@HACK 0x0044423A, patch1
	cmp byte[_HighResPatchEnabled], 1
	jz .patch
	push 0x004DFDD4
	jmp 0x0044423F
.patch:
	pop edi
	pop esi
	pop ebp
	pop ebx
	add esp,0x0CC
	retn
@ENDHACK
	

@HACK 0x004442F7, patch2
	cmp byte[_HighResPatchEnabled], 1
	jz .patch
	push 0x004DFDD4
	jmp 0x004442FC
.patch:
	pop edi
	pop esi
	pop ebp
	pop ebx
	add esp,0x0CC
	retn
@ENDHACK


@HACK 0x00444D79, patch3
	cmp byte[_HighResPatchEnabled], 1
	jz .patch
	mov eax,dword[0x4E4208]
	jmp 0x00444D7E
.patch:
	mov eax,0x0B8
	cmp ecx,eax
	jle 0x00445010
	mov ebx,0x2F
	mov edx,ebx
	imul edx, dword[_SideBarIconCount]
	add edx,eax
	cmp ecx,edx
	jge 0x0044500B
	mov eax,dword[0x516430]
	cmp eax,0x3
	jnz 0x00444E16
	xchg eax,ecx
	mov ecx,0x0B8
	sub eax,ecx
	cdq
	div ebx
	add edi, dword[_SideBarPanelLeftUIPosX]
	lea ecx, [edi]
	sub edi, dword[_SideBarPanelLeftUIPosX]
	cmp eax,0x3
	jg 0x00445010
	jmp 0x00444DBF
@ENDHACK


@CLEAR 0x0044BB50, 0x90, 0x0044BB58
@HACK 0x0044BB50, patch4
	cmp byte[_HighResPatchEnabled], 1
	jz .patch
	mov eax,ecx
	mov ecx,dword[0x4E41FC]
	jmp 0x0044BB58
.patch:
	xchg eax,ecx
	mov ecx,dword[0x4E41FC]
	shr eax,0x1
	add ecx,edx
	xor edx,edx
	add eax,ecx
	mov CX,0x0B8
	mov dword[esp+0x14],eax
	mov eax,dword[0x4EB04C]
	sub eax,ecx
	add edx,0x2F
	div dl
	cbw
	mov ecx,edx
	shr edx,0x1
	imul ecx,eax
	mov dword[esp+0x10],eax
	mov eax,dword[0x4E4200]
	add eax,ecx
	add edx,eax
	mov eax,dword[0x516430]
	mov ecx,dword[esp+0x10]
	xor ebx,ebx
	inc ebx
	jmp 0x0044BB96
@ENDHACK


@HACK 0x0044BE0B, patch5
	cmp byte[_HighResPatchEnabled], 1
	jz .patch
	cmp eax,1
	jbe 0x0044BE15
	jmp 0x0044BE10
.patch:
	cmp eax,ebx
	jbe .loc1
	xchg eax,ebx
.loc1:
	cmp ecx,0x3
	jg 0x0044C10F
	jmp 0x0044BE19
@ENDHACK


@CLEAR 0x004A3E9D, 0x90, 0x004A3EA4
@HACK 0x004A3E9D, patch6 ;align top left
	cmp byte[_HighResPatchEnabled], 1
	jz .patch
	sar eax,1
	mov dword[0x7984D8],eax
	jmp 0x004A3EA4
.patch:
	xor eax,eax
	mov dword[0x7984D8],eax
	jmp 0x004A3EA4
@ENDHACK
