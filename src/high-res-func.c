#include <vars/global.h>
#include <macros/patch.h>
#include <ini.h>

CALL(0x004B28C1, _LoadVideoSettings);

bool HighResPatchEnabled = false;

void LoadVideoSettings()
{
	GameWidth = D2kIniGetInt("Options", "GameWidth", 640);
	GameHeight = D2kIniGetInt("Options", "GameHeight", 400);
	
	if (GameWidth != 640 || GameHeight != 400)
	{
		HighResPatchEnabled = true;
		ScreenWidth = GameWidth;
		ScreenHeight = GameHeight;
		ScreenUnk1 = 390 + GameWidth - 640;
		ScreenUnk2 = 485 + GameWidth - 640;
		ScreenUnk3 = 564 + GameWidth - 640;
		ScreenUnk4 = 501 + GameWidth - 640;
		ScreenUnk5 = 8; 		// <- ?? 000E29EC 04  08  0B  0D (4 8 11 13)
		ScreenUnk6 = 497 + GameWidth - 640; 
	}
	cinit();
}
