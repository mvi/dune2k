#include <windows.h>
#include <winuser.h>

unsigned char *keymap1 = (void*)0x798390;
unsigned char *keymap2 = (void*)0x797E78;

//Below you can find the hotkeys, change them as you like
//You can find the Virtual-Key Codes (e.g. VK_F9) here: http://msdn.microsoft.com/en-us/library/windows/desktop/dd375731(v=vs.85).aspx

int SelectAllUnits = 'E';
int Scatter = 'X';
int CenterNextUnit = 'N';
int Repair = 'T';
int Sell = 'Y';
int Guard = 'G';
int CenterBase = 'H';
int Stop = 'S';
int Bookmark1 = VK_F9;
int Bookmark2 = VK_F10;
int Bookmark3 = VK_F11;
int Bookmark4 = VK_F12;
int SidebarUp = VK_UP;
int SidebarDown = VK_DOWN;
int Alliance = 'A';
int Retreat = 'R';
int OptionsMenu = VK_ESCAPE;
int Team1 = '1';
int Team2 = '2';
int Team3 = '3';
int Team4 = '4';
int Team5 = '5';
int Team6 = '6';
int Team7 = '7';
int Team8 = '8';
int Team9 = '9';
int Team10 = '0';
int CTRL = VK_CONTROL;
int ALT = VK_MENU;
int SHIFT = VK_SHIFT;
int PrivateChat1 = VK_F1;
int PrivateChat2 = VK_F2;
int PrivateChat3 = VK_F3;
int PrivateChat4 = VK_F4;
int PrivateChat5 = VK_F5;
int PublicChat = VK_F6;
int WOLPageReply = VK_F8;
int WOLProposeDraw = 'D';
int CenterSelectedUnits = VK_HOME;


void HandleKeyEvent(int key, int keyIsDown)
{
	int offset;
	
	if (key == SelectAllUnits) offset = 'E';
	else if (key == Scatter) offset = 'X';
	else if (key == CenterNextUnit) offset = 'N';
	else if (key == Repair) offset = 'T';
	else if (key == Sell) offset = 'Y';
	else if (key == Guard) offset = 'G';
	else if (key == CenterBase) offset = 'H';
	else if (key == Stop) offset = 'S';
	else if (key == Bookmark1) offset = VK_F9;
	else if (key == Bookmark2) offset = VK_F10;
	else if (key == Bookmark3) offset = VK_F11;
	else if (key == Bookmark4) offset = VK_F12;
	else if (key == SidebarUp) offset = VK_UP;
	else if (key == SidebarDown) offset = VK_DOWN;
	else if (key == Alliance) offset = 'A';
	else if (key == Retreat) offset = 'R';
	else if (key == OptionsMenu) offset = VK_ESCAPE;
	else if (key == Team1) offset = '1';
	else if (key == Team2) offset = '2';
	else if (key == Team3) offset = '3';
	else if (key == Team4) offset = '4';
	else if (key == Team5) offset = '5';
	else if (key == Team6) offset = '6';
	else if (key == Team7) offset = '7';
	else if (key == Team8) offset = '8';
	else if (key == Team9) offset = '9';
	else if (key == Team10) offset = '0';
	else if (key == CTRL) offset = VK_CONTROL;
	else if (key == ALT) offset = VK_MENU;
	else if (key == SHIFT) offset = VK_SHIFT;
	else if (key == PrivateChat1) offset = VK_F1;
	else if (key == PrivateChat2) offset = VK_F2;
	else if (key == PrivateChat3) offset = VK_F3;
	else if (key == PrivateChat4) offset = VK_F4;
	else if (key == PrivateChat5) offset = VK_F5;
	else if (key == PublicChat) offset = VK_F6;
	else if (key == WOLPageReply) offset = VK_F8;
	else if (key == WOLProposeDraw) offset = 'D';
	else if (key == CenterSelectedUnits) offset = VK_HOME;
	else offset = key;
	
	if (keyIsDown)
	{
		keymap1[offset] = 1;
		keymap2[offset] = 1;
	}
	else
	{
		keymap2[offset] = 0;
	}
}
