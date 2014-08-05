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
