%include "patch.inc"

@LJMP 0x004A33A4, _WM_KeyDown
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

CMP ESI, DWORD [Bookmark1]
JNZ SHORT .Bookmark2_
MOV BYTE [F9_Key+0x797E78],BL
MOV BYTE [F9_Key+0x798390],BL
JMP 0x4A33B0

.Bookmark2_:
CMP ESI, DWORD [Bookmark2]
JNZ SHORT .Bookmark3_
MOV BYTE [F10_Key+0x797E78],BL
MOV BYTE [F10_Key+0x798390],BL
JMP 0x4A33B0

.Bookmark3_:
CMP ESI, DWORD [Bookmark3]
JNZ SHORT .Bookmark4_
MOV BYTE [F11_Key+0x797E78],BL
MOV BYTE [F11_Key+0x798390],BL
JMP 0x4A33B0

.Bookmark4_:
CMP ESI, DWORD [Bookmark4]
JNZ SHORT .SidebarDown_
MOV BYTE [F12_Key+0x797E78],BL
MOV BYTE [F12_Key+0x798390],BL
JMP 0x4A33B0

.SidebarDown_:
CMP ESI, DWORD [SidebarDown]
JNZ SHORT .SidebarUp_
MOV BYTE [DownArrow_Key+0x797E78],BL
MOV BYTE [DownArrow_Key+0x798390],BL
JMP 0x4A33B0

.SidebarUp_:
CMP ESI, DWORD [SidebarUp]
JNZ SHORT .SelectAllUnits_
MOV BYTE [UpArrow_Key+0x797E78],BL
MOV BYTE [UpArrow_Key+0x798390],BL
JMP 0x4A33B0

.SelectAllUnits_:
CMP ESI, DWORD [SelectAllUnits]
JNZ SHORT .Scatter_
MOV BYTE [E_Key+0x797E78],BL
MOV BYTE [E_Key+0x798390],BL
JMP 0x4A33B0

.Scatter_:
CMP ESI, DWORD [Scatter]
JNZ SHORT .CenterNextUnit_
MOV BYTE [X_Key+0x797E78],BL
MOV BYTE [X_Key+0x798390],BL
JMP 0x4A33B0

.CenterNextUnit_:
CMP ESI, DWORD [CenterNextUnit]
JNZ SHORT .Repair_
MOV BYTE [N_Key+0x797E78],BL
MOV BYTE [N_Key+0x798390],BL
JMP 0x4A33B0

.Repair_:
CMP ESI, DWORD [Repair]
JNZ SHORT .Sell_
MOV BYTE [T_Key+0x797E78],BL
MOV BYTE [T_Key+0x798390],BL
JMP 0x4A33B0

.Sell_:
CMP ESI, DWORD [Sell]
JNZ SHORT .Guard_
MOV BYTE [Y_Key+0x797E78],BL
MOV BYTE [Y_Key+0x798390],BL
JMP 0x4A33B0

.Guard_:
CMP ESI, DWORD [Guard]
JNZ SHORT .CenterBase_
MOV BYTE [G_Key+0x797E78],BL
MOV BYTE [G_Key+0x798390],BL
JMP 0x4A33B0

.CenterBase_:
CMP ESI, DWORD [CenterBase]
JNZ SHORT .Stop_
MOV BYTE [H_Key+0x797E78],BL
MOV BYTE [H_Key+0x798390],BL
JMP 0x4A33B0

.Stop_:
CMP ESI, DWORD [Stop]
JNZ SHORT .Alliance_
MOV BYTE [S_Key+0x797E78],BL
MOV BYTE [S_Key+0x798390],BL
JMP 0x4A33B0

.Alliance_:
CMP ESI, DWORD [Alliance]
JNZ SHORT .Retreat_
MOV BYTE [A_Key+0x797E78],BL
MOV BYTE [A_Key+0x798390],BL
JMP 0x4A33B0

.Retreat_:
CMP ESI, DWORD [Retreat]
JNZ SHORT .UnknownKey_
MOV BYTE [R_Key+0x797E78],BL
MOV BYTE [R_Key+0x798390],BL
JMP 0x4A33B0

.UnknownKey_:
MOV BYTE [ESI+0x797E78],BL
MOV BYTE [ESI+0x798390],BL
JMP 0x4A33B0


_WM_KeyUp:

CMP EAX, DWORD [Bookmark1]
JNZ SHORT .Bookmark2_2
MOV BYTE [F9_Key+0x797E78],0
JMP 0x4A346F

.Bookmark2_2:
CMP EAX, DWORD [Bookmark2]
JNZ SHORT .Bookmark3_2
MOV BYTE [F10_Key+0x797E78],0
JMP 0x4A346F

.Bookmark3_2:
CMP EAX, DWORD [Bookmark3]
JNZ SHORT .Bookmark4_2
MOV BYTE [F11_Key+0x797E78],0
JMP 0x4A346F

.Bookmark4_2:
CMP EAX, DWORD [Bookmark4]
JNZ SHORT .SidebarDown_2
MOV BYTE [F12_Key+0x797E78],0
JMP 0x4A346F

.SidebarDown_2:
CMP EAX, DWORD [SidebarDown]
JNZ SHORT .SidebarUp_2
MOV BYTE [DownArrow_Key+0x797E78],0
JMP 0x4A346F

.SidebarUp_2:
CMP EAX, DWORD [SidebarUp]
JNZ SHORT .SelectAllUnits_2
MOV BYTE [UpArrow_Key+0x797E78],0
JMP 0x4A346F

.SelectAllUnits_2:
CMP EAX, DWORD [SelectAllUnits]
JNZ SHORT .Scatter_2
MOV BYTE [E_Key+0x797E78],0
JMP 0x4A346F

.Scatter_2:
CMP EAX, DWORD [Scatter]
JNZ SHORT .CenterNextUnit_2
MOV BYTE [X_Key+0x797E78],0
JMP 0x4A346F

.CenterNextUnit_2:
CMP EAX, DWORD [CenterNextUnit]
JNZ SHORT .Repair_2
MOV BYTE [N_Key+0x797E78],0
JMP 0x4A346F

.Repair_2:
CMP EAX, DWORD [Repair]
JNZ SHORT .Sell_2
MOV BYTE [T_Key+0x797E78],0
JMP 0x4A346F

.Sell_2:
CMP EAX, DWORD [Sell]
JNZ SHORT .Guard_2
MOV BYTE [Y_Key+0x797E78],0
JMP 0x4A346F

.Guard_2:
CMP EAX, DWORD [Guard]
JNZ SHORT .CenterBase_2
MOV BYTE [G_Key+0x797E78],0
JMP 0x4A346F

.CenterBase_2:
CMP EAX, DWORD [CenterBase]
JNZ SHORT .Stop_2
MOV BYTE [H_Key+0x797E78],0
JMP 0x4A346F

.Stop_2:
CMP EAX, DWORD [Stop]
JNZ SHORT .Alliance_2
MOV BYTE [S_Key+0x797E78],0
JMP 0x4A346F

.Alliance_2:
CMP EAX, DWORD [Alliance]
JNZ SHORT .Retreat_2
MOV BYTE [A_Key+0x797E78],0
JMP 0x4A346F

.Retreat_2:
CMP EAX, DWORD [Retreat]
JNZ SHORT .UnknownKey_2
MOV BYTE [R_Key+0x797E78],0
JMP 0x4A346F

.UnknownKey_2:
MOV BYTE [EAX+0x797E78],0
JMP 0x4A346F

