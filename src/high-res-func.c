#include <vars/global.h>
#include <macros/patch.h>
#include <ini.h>

CALL(0x004B28C1, _LoadVideoSettings);

bool HighResPatchEnabled = false;
int HighResAddedWidth;
int HighResAddedHeight;

void LoadVideoSettings()
{
	GameWidth = D2kIniGetInt("Options", "GameWidth", 640);
	GameHeight = D2kIniGetInt("Options", "GameHeight", 400);

	if (GameWidth != 640 || GameHeight != 400)
	{
		HighResPatchEnabled = true;
		ScreenWidth = GameWidth;
		ScreenHeight = GameHeight;
		HighResAddedWidth = GameWidth - 640;
		HighResAddedHeight = GameHeight - 400;
		ScreenUnk1 = 390 + HighResAddedWidth;
		ScreenUnk2 = 485 + HighResAddedWidth;
		ScreenUnk3 = 563 + HighResAddedWidth;
		ScreenUnk4 = 501 + HighResAddedWidth;
		SideBarIconCount = (GameHeight - 212) / 47;
		ScreenUnk6 = 497 + HighResAddedWidth;
	}
	cinit();
}
