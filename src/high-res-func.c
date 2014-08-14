#include <vars/global.h>
#include <macros/patch.h>
#include <ini.h>

CALL(0x004B28C1, _LoadVideoSettings);

bool HighResPatchEnabled = false;

void LoadVideoSettings()
{
	ScreenWidth2 = D2kIniGetInt("Options", "ScreenWidth", 640);
	ScreenHeight2 = D2kIniGetInt("Options", "ScreenHeight", 400);
	
	if (ScreenWidth2 != 640 || ScreenHeight2 != 400)
	{
		HighResPatchEnabled = true;
		ScreenWidth = ScreenWidth2;
		ScreenHeight = ScreenHeight2;
		ScreenUnk1 = 390 + ScreenWidth - 640;
		ScreenUnk2 = 485 + ScreenWidth - 640;
		ScreenUnk3 = 564 + ScreenWidth - 640;
		ScreenUnk4 = 501 + ScreenWidth - 640;
		ScreenUnk5 = 8; 		// <- ?? 000E29EC 04  08  0B  0D (4 8 11 13)
		ScreenUnk6 = 497 + ScreenWidth - 640; 
	}
	cinit();
}
