%include "patch.inc"

@CLEAR 0x004A33A4, 0x90, 0x004A33B0
@LJMP 0x004A33A4, _WM_KeyDown

@CLEAR 0x004A3468, 0x90, 0x004A346F
@LJMP 0x004A3468, _WM_KeyUp

; http://msdn.microsoft.com/en-us/library/windows/desktop/dd375731(v=vs.85).aspx
; Do -NOT- change the keys below... But you can add new keys, use the site above to find out the Hex values

%define A_Key 0x41
%define B_Key 0x42
%define C_Key 0x43
%define D_Key 0x44
%define E_Key 0x45
%define F_Key 0x46
%define G_Key 0x47
%define H_Key 0x48
%define I_Key 0x49
%define J_Key 0x4A
%define K_Key 0x4B
%define L_Key 0x4C
%define M_Key 0x4D
%define N_Key 0x4E
%define O_Key 0x4F
%define P_Key 0x50
%define Q_Key 0x51
%define R_Key 0x52
%define S_Key 0x53
%define T_Key 0x54
%define U_Key 0x55
%define V_Key 0x56
%define W_Key 0x57
%define X_Key 0x58
%define Y_Key 0x59
%define Z_Key 0x5A
%define F9_Key 0x78
%define F10_Key 0x79
%define F11_Key 0x7A
%define F12_Key 0x7B
%define Spacebar_Key 0x20
%define UpArrow_Key 0x26
%define DownArrow_Key 0x28


;Below you can find the hotkeys, change them as you like

[section .idata]
SelectAllUnits dd E_Key
Scatter dd X_Key
CenterNextUnit dd N_Key
Repair dd T_Key
Sell dd Y_Key
Guard dd G_Key
CenterBase dd H_Key
Stop dd S_Key
Bookmark1 dd F9_Key
Bookmark2 dd F10_Key
Bookmark3 dd F11_Key
Bookmark4 dd F12_Key
SidebarUp dd UpArrow_Key
SidebarDown dd DownArrow_Key
Alliance dd A_Key
Retreat dd R_Key

;Missing:
;0-9: Groups
;ESC/Space: Options Menu


[section .text]

_WM_KeyDown:

cmp esi, dword [Bookmark1]
jnz short .Bookmark2_
mov byte [F9_Key+0x797E78],BL
mov byte [F9_Key+0x798390],BL
jmp 0x4A33B0

.Bookmark2_:
cmp esi, dword [Bookmark2]
jnz short .Bookmark3_
mov byte [F10_Key+0x797E78],BL
mov byte [F10_Key+0x798390],BL
jmp 0x4A33B0

.Bookmark3_:
cmp esi, dword [Bookmark3]
jnz short .Bookmark4_
mov byte [F11_Key+0x797E78],BL
mov byte [F11_Key+0x798390],BL
jmp 0x4A33B0

.Bookmark4_:
cmp esi, dword [Bookmark4]
jnz short .SidebarDown_
mov byte [F12_Key+0x797E78],BL
mov byte [F12_Key+0x798390],BL
jmp 0x4A33B0

.SidebarDown_:
cmp esi, dword [SidebarDown]
jnz short .SidebarUp_
mov byte [DownArrow_Key+0x797E78],BL
mov byte [DownArrow_Key+0x798390],BL
jmp 0x4A33B0

.SidebarUp_:
cmp esi, dword [SidebarUp]
jnz short .SelectAllUnits_
mov byte [UpArrow_Key+0x797E78],BL
mov byte [UpArrow_Key+0x798390],BL
jmp 0x4A33B0

.SelectAllUnits_:
cmp esi, dword [SelectAllUnits]
jnz short .Scatter_
mov byte [E_Key+0x797E78],BL
mov byte [E_Key+0x798390],BL
jmp 0x4A33B0

.Scatter_:
cmp esi, dword [Scatter]
jnz short .CenterNextUnit_
mov byte [X_Key+0x797E78],BL
mov byte [X_Key+0x798390],BL
jmp 0x4A33B0

.CenterNextUnit_:
cmp esi, dword [CenterNextUnit]
jnz short .Repair_
mov byte [N_Key+0x797E78],BL
mov byte [N_Key+0x798390],BL
jmp 0x4A33B0

.Repair_:
cmp esi, dword [Repair]
jnz short .Sell_
mov byte [T_Key+0x797E78],BL
mov byte [T_Key+0x798390],BL
jmp 0x4A33B0

.Sell_:
cmp esi, dword [Sell]
jnz short .Guard_
mov byte [Y_Key+0x797E78],BL
mov byte [Y_Key+0x798390],BL
jmp 0x4A33B0

.Guard_:
cmp esi, dword [Guard]
jnz short .CenterBase_
mov byte [G_Key+0x797E78],BL
mov byte [G_Key+0x798390],BL
jmp 0x4A33B0

.CenterBase_:
cmp esi, dword [CenterBase]
jnz short .Stop_
mov byte [H_Key+0x797E78],BL
mov byte [H_Key+0x798390],BL
jmp 0x4A33B0

.Stop_:
cmp esi, dword [Stop]
jnz short .Alliance_
mov byte [S_Key+0x797E78],BL
mov byte [S_Key+0x798390],BL
jmp 0x4A33B0

.Alliance_:
cmp esi, dword [Alliance]
jnz short .Retreat_
mov byte [A_Key+0x797E78],BL
mov byte [A_Key+0x798390],BL
jmp 0x4A33B0

.Retreat_:
cmp esi, dword [Retreat]
jnz short .UnknownKey_
mov byte [R_Key+0x797E78],BL
mov byte [R_Key+0x798390],BL
jmp 0x4A33B0

.UnknownKey_:
mov byte [esi+0x797E78],BL
mov byte [esi+0x798390],BL
jmp 0x4A33B0


_WM_KeyUp:

cmp eax, dword [Bookmark1]
jnz short .Bookmark2_2
mov byte [F9_Key+0x797E78],0
jmp 0x4A346F

.Bookmark2_2:
cmp eax, dword [Bookmark2]
jnz short .Bookmark3_2
mov byte [F10_Key+0x797E78],0
jmp 0x4A346F

.Bookmark3_2:
cmp eax, dword [Bookmark3]
jnz short .Bookmark4_2
mov byte [F11_Key+0x797E78],0
jmp 0x4A346F

.Bookmark4_2:
cmp eax, dword [Bookmark4]
jnz short .SidebarDown_2
mov byte [F12_Key+0x797E78],0
jmp 0x4A346F

.SidebarDown_2:
cmp eax, dword [SidebarDown]
jnz short .SidebarUp_2
mov byte [DownArrow_Key+0x797E78],0
jmp 0x4A346F

.SidebarUp_2:
cmp eax, dword [SidebarUp]
jnz short .SelectAllUnits_2
mov byte [UpArrow_Key+0x797E78],0
jmp 0x4A346F

.SelectAllUnits_2:
cmp eax, dword [SelectAllUnits]
jnz short .Scatter_2
mov byte [E_Key+0x797E78],0
jmp 0x4A346F

.Scatter_2:
cmp eax, dword [Scatter]
jnz short .CenterNextUnit_2
mov byte [X_Key+0x797E78],0
jmp 0x4A346F

.CenterNextUnit_2:
cmp eax, dword [CenterNextUnit]
jnz short .Repair_2
mov byte [N_Key+0x797E78],0
jmp 0x4A346F

.Repair_2:
cmp eax, dword [Repair]
jnz short .Sell_2
mov byte [T_Key+0x797E78],0
jmp 0x4A346F

.Sell_2:
cmp eax, dword [Sell]
jnz short .Guard_2
mov byte [Y_Key+0x797E78],0
jmp 0x4A346F

.Guard_2:
cmp eax, dword [Guard]
jnz short .CenterBase_2
mov byte [G_Key+0x797E78],0
jmp 0x4A346F

.CenterBase_2:
cmp eax, dword [CenterBase]
jnz short .Stop_2
mov byte [H_Key+0x797E78],0
jmp 0x4A346F

.Stop_2:
cmp eax, dword [Stop]
jnz short .Alliance_2
mov byte [S_Key+0x797E78],0
jmp 0x4A346F

.Alliance_2:
cmp eax, dword [Alliance]
jnz short .Retreat_2
mov byte [A_Key+0x797E78],0
jmp 0x4A346F

.Retreat_2:
cmp eax, dword [Retreat]
jnz short .UnknownKey_2
mov byte [R_Key+0x797E78],0
jmp 0x4A346F

.UnknownKey_2:
mov byte [eax+0x797E78],0
jmp 0x4A346F

