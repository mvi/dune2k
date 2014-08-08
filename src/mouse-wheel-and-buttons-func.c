#include <windows.h>
#include <winuser.h>
#include <stdbool.h>

void HandleKeyEvent(int key, bool keyIsDown);

bool *UpArrowKeyIsDown1 = (void*)0x26+0x797E78;
bool *UpArrowKeyIsDown2 = (void*)0x26+0x798390;
bool *DownArrowKeyIsDown1 = (void*)0x28+0x797E78;
bool *DownArrowKeyIsDown2 = (void*)0x28+0x798390;
bool MouseWheelTriggered = false;

void HandleWindowMessage(int message, int wParam)
{
	short hi = wParam >> 16;
	short lo = wParam & 0x0000FFFF;

	switch(message)
	{
		case WM_MOUSEWHEEL:
			MouseWheelTriggered = true;
			if (hi > 0) //MouseWheel Up
			{
				*UpArrowKeyIsDown1 = true;
				*UpArrowKeyIsDown2 = true;
			}
			else //MouseWheel Down
			{
				*DownArrowKeyIsDown1 = true;
				*DownArrowKeyIsDown2 = true;
			}
			break;
		case WM_MBUTTONDOWN:
			HandleKeyEvent(VK_MBUTTON, true);
			break;
		case WM_MBUTTONUP:
			HandleKeyEvent(VK_MBUTTON, false);
			break;
		case WM_XBUTTONDOWN:
			if ((lo & MK_XBUTTON1) != 0)
				HandleKeyEvent(VK_XBUTTON1, true);
			if ((lo & MK_XBUTTON2) != 0)
				HandleKeyEvent(VK_XBUTTON2, true);
			break;
		case WM_XBUTTONUP:
			if ((lo & MK_XBUTTON1) == 0)
				HandleKeyEvent(VK_XBUTTON1, false);
			if ((lo & MK_XBUTTON2) == 0)
				HandleKeyEvent(VK_XBUTTON2, false);
			break;
	}
}
