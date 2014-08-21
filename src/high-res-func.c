#include <stdio.h>
#include "vars/global.h"
#include "macros/patch.h"
#include "ini.h"

CALL(0x004B28C1, _LoadVideoSettings);
CALL(0x00437C7E, _LoadHighResBackground);

bool HighResPatchEnabled = false;
bool HighResCenterUI = false;
bool HighResUilCenterExcept = false;
bool HighResControlCenterExcept = false;
bool HighResControlFirstTimeCenter = true;
bool HighResInitialized = false;
int HighResAddedWidth;
int HighResAddedHeight;
int HighResUIAlignX;
int HighResUIAlignY;
char WidthStr[10];
char HeightStr[10];
char uibb_r16FileName[100];
char uibb_r8FileName[100];

void LoadCustomUIIB();

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
		HighResUIAlignX = HighResAddedWidth > 0 ? (HighResAddedWidth / 2) : 0;
		HighResUIAlignY = HighResAddedHeight > 0 ? (HighResAddedHeight / 2) : 0;
		CreditsUIPosX = 390 + HighResAddedWidth;
		PowerBarUIPosX = 485 + HighResAddedWidth;
		SideBarPanelRightUIPosX = 563 + HighResAddedWidth;
		SideBarPanelLeftUIPosX = 501 + HighResAddedWidth;
		SideBarIconCount = (GameHeight - 212) / 47;
		MiniMapUIPosX = 497 + HighResAddedWidth;
		if (GameWidth % 32 != 0){
			SideBarWidth = 160 + (GameWidth%32);
		}
	}
	sprintf(WidthStr, "%d", GameWidth);
	sprintf(HeightStr, "%d", GameHeight);
	cinit();
}

void LoadHighResBackground(char *fileName, int unk)
{
	if (!HighResInitialized)
	{
		LoadCustomUIIB();
		HighResInitialized = true;
	}
	
	char fPath[255];
	strcpy(fPath, ".\\Data\\");
	strcat(fPath, fileName);
	strcat(fPath, ".");
	strcat(fPath, WidthStr);
	strcat(fPath, "x");
	strcat(fPath, HeightStr);
	strcat(fPath, ".tga");
	
	if (FileExists(fPath))
	{
		HighResCenterUI = true;
		char file[255];
		strcpy(file, fileName);
		strcat(file, ".");
		strcat(file, WidthStr);
		strcat(file, "x");
		strcat(file, HeightStr);
		LoadBackgroundGFX(file, unk);
	}
	else LoadBackgroundGFX(fileName, unk);
}

void LoadCustomUIIB()
{
	char UIIB16Path[255];
	strcpy(UIIB16Path, ".\\Data\\UIBB.");
	strcat(UIIB16Path, WidthStr);
	strcat(UIIB16Path, "x");
	strcat(UIIB16Path, HeightStr);
	strcat(UIIB16Path, ".R16");
	
	if (FileExists(UIIB16Path))
	{
		strcpy(uibb_r16FileName, "UIBB.");
		strcat(uibb_r16FileName, WidthStr);
		strcat(uibb_r16FileName, "x");
		strcat(uibb_r16FileName, HeightStr);
		strcat(uibb_r16FileName, ".R16");
	}
	else strcpy(uibb_r16FileName, "UIBB.R16");

	char UIIB8Path[255];
	strcpy(UIIB8Path, ".\\Data\\UIBB.");
	strcat(UIIB8Path, WidthStr);
	strcat(UIIB8Path, "x");
	strcat(UIIB8Path, HeightStr);
	strcat(UIIB8Path, ".R8");
	
	if (FileExists(UIIB8Path))
	{
		strcpy(uibb_r8FileName, "UIBB.");
		strcat(uibb_r8FileName, WidthStr);
		strcat(uibb_r8FileName, "x");
		strcat(uibb_r8FileName, HeightStr);
		strcat(uibb_r8FileName, ".R8");
	}
	else strcpy(uibb_r8FileName, "UIBB.R8");
}

void UilCenterExceptCheck(char *fileName)
{
	HighResUilCenterExcept = !strcmp(fileName, "Globe.uid") || !strcmp(fileName, "Globe.uil") || !strcmp(fileName, "score_1.uil");
}

void ControlCenterExceptCheck(char *controlName)
{
	HighResControlFirstTimeCenter = true;
	HighResControlCenterExcept = !strcmp(controlName, "BUTTON serialModem") || StartsWith(controlName, "LISTBOX");
	if (!strcmp(controlName, "BUTTON serialModem")) HighResControlFirstTimeCenter = false;
}

void DrawEmptySideBarIcons(int *unk, int *image)
{
	int y = SideBarPanelsPosY + (SideBarIconHeight * 4);
	for (int i = SideBarIconCount - 4; i-- > 0;)
	{
		DrawImageUnk(unk, SideBarPanelRightUIPosX, y + (i * SideBarIconHeight), image, 0, 0, 0);
		DrawImageUnk(unk, SideBarPanelLeftUIPosX, y + (i * SideBarIconHeight), image, 0, 0, 0);
	}
}

