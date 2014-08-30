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

void MakeCustomUIBB(char *UIBBR16Name)
{
	FILE *UIBBR16 = fopen(".\\data\\UIBB.R16", "rb"); 
    if (UIBBR16)
    {
		int p; 
		int k;
		int FileSizeUIBBR16 = 640*400; //original UIBB.R16
		unsigned short * OriginalUIBB;
		OriginalUIBB = (unsigned short*) calloc (FileSizeUIBBR16, sizeof(unsigned short));
		fread(OriginalUIBB, sizeof(unsigned short), FileSizeUIBBR16, UIBBR16);
		fclose(UIBBR16);
		unsigned short * HighResUIBB;
		HighResUIBB = (unsigned short*) calloc (GameWidth*GameHeight, sizeof(unsigned short));
		
		//####################### CORNER ####################### 
		// Copy original into new corner
		p = (GameWidth-640);
		k = 0;
		for (int i = 0; i < 400; ++i)
		{
			for (int j = 0; j < 640; ++j)
			{
				HighResUIBB[p+j] = OriginalUIBB[k+j];
			}
			p = p + GameWidth;
			k = k + 640;
		}	
		// Add black to block dude when using adjusted SideBarWidth
		p = GameWidth*20 + GameWidth-160-32;
		for (int i = 0; i < 400; ++i)
		{
			for (int j = 0; j < 32; ++j)
			{
				HighResUIBB[p+j] = 0x00;
			}
			p = p + GameWidth;
		}
		
		//####################### TOP BAR ####################### 
		//Top bar copy
		unsigned short * TopBar;
		TopBar = (unsigned short*) calloc (20*305*10, sizeof(unsigned short));
		p = 0;
		k = 71; //jump over options button
		for (int i = 0; i < 20; ++i)
		{
			for (int j = 0; j < 305; ++j)
			{
				TopBar[p+j] = OriginalUIBB[k+j];
			}			
			p = p + 305;
			k = k + 640;
		}		
		//Top bar pasting
		p = 0;
		k = 0;
		for (int i = 0; i < 20; ++i)
		{
			int tj = 0;
			for (int j = 0; j < GameWidth-640+71; ++j) //+71 to remove 'old' options button
			{
				HighResUIBB[p+j] = TopBar[k+j-tj*305];
			}
			p = p + GameWidth;
			k = k + 305;
		}
		
		//####################### BUILDING BLOCK ####################### 
		//Building block fix I (overwrite old power arrow)
		p = 268*640 + 485;
		k = 268*640 + 485 - 8*640; //copy 6x6 pixels from 8 pixels higher
		for (int i = 0; i < 6; ++i)
		{
			for (int j = 0; j < 6; ++j)
			{
				OriginalUIBB[p+j] = OriginalUIBB[k+j];
			}
			p = p + 640;
			k = k + 640;
		}			
		//Building block copy
		unsigned short * BuildBlock;
		BuildBlock = (unsigned short*) calloc (159*160, sizeof(unsigned short));
		p = 0;
		k = 183*640 + 640 - 160;
		for (int i = 0; i < 159; ++i)
		{
			for (int j = 0; j < 160; ++j)
			{
				BuildBlock[p+j] = OriginalUIBB[k+j];
			}			
			p = p + 160;
			k = k + 640;
		}				
		//Building block fix II (overwrite old build icons)
		p = 21;
		k = 83;
		for (int i = 0; i < 159; ++i)
		{
			for (int j = 0; j < 60; ++j)
			{
				BuildBlock[p+j] = 3074; //'\x02\x0c', purple colour
				BuildBlock[k+j] = 3074;
			}			
			p = p + 160;
			k = k + 160;
		}			
		//Building block pasting
		p = 183*GameWidth + GameWidth - 160;
		k = 0;
		for (int i = 0; i < GameHeight-183; ++i)
		{
			for (int j = 0; j < 160; ++j)
			{
				HighResUIBB[p+j] = BuildBlock[k+j];
			}
			p = p + GameWidth;
			k = k + 160;
			if ( k >= 159*160){ k = 0; }
		}
		
		//####################### BOTTOM PIECE ####################### 
		p = (GameHeight-29)*GameWidth + GameWidth - 160;
		k = (400-29)*640 + 640 - 160;
		for (int i = 0; i < 29; ++i)
		{
			for (int j = 0; j < 160; ++j)
			{
				HighResUIBB[p+j] = OriginalUIBB[k+j];
			}
			p = p + GameWidth;
			k = k + 640;
		}
		
		//Output the Custom High Res UIBB.R16 file
		FILE *UIBBR16 = fopen(UIBBR16Name, "wb"); //(over)write it
		if (UIBBR16)
		{
		fwrite(HighResUIBB, sizeof(unsigned short), GameWidth*GameHeight, UIBBR16);
		fclose(UIBBR16);
		}
	}
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
	
	if (!FileExists(UIIB16Path) && HighResPatchEnabled)
	{
		MakeCustomUIBB(UIIB16Path);
	}
	
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
	HighResUilCenterExcept = !strcmp(fileName, "Globe.uid") || !strcmp(fileName, "Globe.uil") || !strcmp(fileName, "score_1.uil") || !strcmp(fileName, "score_1.uid");
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
