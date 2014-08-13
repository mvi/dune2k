#include <vars/keymap.h>

void HandleKeyEvent(int key, bool keyIsDown);

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
				KeyIsDown1[VK_UP] = true;
				KeyIsDown2[VK_UP] = true;
			}
			else //MouseWheel Down
			{
				KeyIsDown1[VK_DOWN] = true;
				KeyIsDown2[VK_DOWN] = true;
			}
			break;
		case WM_MBUTTONDOWN:
			HandleKeyEvent(VK_MBUTTON, true);
			break;
		case WM_MBUTTONUP:
			HandleKeyEvent(VK_MBUTTON, false);
			break;
		case WM_XBUTTONDOWN:
			if (lo & MK_XBUTTON1)
				HandleKeyEvent(VK_XBUTTON1, true);
			if (lo & MK_XBUTTON2)
				HandleKeyEvent(VK_XBUTTON2, true);
			break;
		case WM_XBUTTONUP:
			if (!(lo & MK_XBUTTON1))
				HandleKeyEvent(VK_XBUTTON1, false);
			if (!(lo & MK_XBUTTON2))
				HandleKeyEvent(VK_XBUTTON2, false);
			break;
	}
}
