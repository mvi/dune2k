#include <stdbool.h>

// This header works with sym.asm which defines the Vanilla symbols
// This header will be split up as it becomes larger

// ### Constants ###

enum Sides {
	Atreides = 0,
	Harkonnen,
	Ordos
};

enum Colors {
	Blue = 0,
	Red,
	Teal,
	Purple,
	Gray,
	Brown,
	Gold,
	LightBrown
};

// ### Global Variables ###

//Network settings
extern unsigned int SendRate;
extern unsigned int ReconnectTimeOutToPlayer;
extern unsigned int InitialConnectTimeOut;

extern unsigned int UnknownNetVar1;
extern unsigned int UnknownNetVar2;
extern unsigned int UnknownNetVar3;
extern unsigned int UnknownNetVar4;
extern unsigned int UnknownNetVar5;

//Others
extern int MousePositionX;
extern int MousePositionY;

extern unsigned char MySideID;
extern bool Win;
extern bool Lose;
extern unsigned char DifficultyLevel;
extern int GameType;

extern char NetworkGame;

//Multiplayer settings
extern unsigned char NetUnitCount;
extern unsigned char NetTechLevel;
extern unsigned short NetStartingCredits;
extern unsigned char NetAIPlayers;
extern bool NetCrates;
extern unsigned char NetWorms;
extern char NetPlayerName[];
extern unsigned char NetPlayerSide;
extern unsigned char NetPlayerColor;
extern unsigned char NetPlayerHandicap;
extern char NetIPAddress[];
extern char NetModemPhone[];
extern unsigned char NetSerialComPort;

//Game settings
extern bool FirstTimePlay;
extern unsigned int ScrollRate;
extern unsigned short GameSpeed;
extern unsigned int GameBitsPerPixel;
extern unsigned int SFXVolume;
extern unsigned int MusicVolume;

extern bool MoviesEnabled;
extern bool SoundsEnabled;
extern bool SkipIntro;
extern bool VideoBackBuffer;
extern bool DebugMode;
extern bool ForceNoCD;
extern bool FullScreen;
extern bool Force480Height;

//WOL
extern bool AllowFindUser;
extern bool AllowPageUser;
extern bool LanguageFilter;
extern bool ShowAllGames;
extern bool Microphone;

//Screen display stuff
extern int ScreenWidth;
extern int ScreenHeight;
extern int ScreenWidth2;
extern int ScreenHeight2;
extern unsigned short ScreenUnk1;
extern unsigned short ScreenUnk2;
extern unsigned short ScreenUnk3;
extern unsigned short ScreenUnk4;
extern unsigned char ScreenUnk5;
extern unsigned short ScreenUnk6;

extern bool HighResPatchEnabled;

//Others
extern unsigned char MaxPlayers;
extern bool TournamentGame;
extern bool PrivateGame;
extern unsigned char NetPlayerHandicap;

extern unsigned int AtreidesMoney;


// ### Functions ###
unsigned char __fastcall TextOnScreen(int a1, int a2, int a3, int a4, int a5, int a6, unsigned char a7, int a8, int a9);

int GenerateUnitMoveOrder(int,int,int);
int GenerateUnitAttackUnitOrder(int,int,int);

void LoadDune2000Cfg();
void SaveDune2000Cfg();

void cinit();

