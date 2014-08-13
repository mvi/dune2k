#include <macros/patch.h>
#include <vars/global.h>
#include <vars/hotkeys.h>
#include <ini.h>

CALL(0x00470BA0, _SaveDune2000Ini);
CALL(0x00470A68, _LoadDune2000Ini);

LPCTSTR dune2000Ini = ".\\dune2000.ini";

void SaveDune2000Ini()
{
	D2kIniSetInt("MultiPlayer", "UnitCount", NetUnitCount);
	D2kIniSetInt("MultiPlayer", "TechLevel", NetTechLevel);
	D2kIniSetInt("MultiPlayer", "StartingCredits", NetStartingCredits);
	D2kIniSetInt("MultiPlayer", "AIPlayers", NetAIPlayers);
	D2kIniSetBool("MultiPlayer", "Crates", NetCrates);
	D2kIniSetInt("MultiPlayer", "Worms", NetWorms);
	D2kIniSetString("MultiPlayer", "PlayerName", NetPlayerName);
	D2kIniSetInt("MultiPlayer", "PlayerSide", NetPlayerSide);
	D2kIniSetInt("MultiPlayer", "PlayerColor", NetPlayerColor);
	D2kIniSetInt("MultiPlayer", "PlayerHandicap", NetPlayerHandicap);
	
	D2kIniSetString("MultiPlayer", "IPAddress", NetIPAddress);
	D2kIniSetString("MultiPlayer", "ModemPhone", NetModemPhone);
	D2kIniSetInt("MultiPlayer", "SerialComPort", NetSerialComPort);

	D2kIniSetBool("Options", "FirstTimePlay", FirstTimePlay);
	D2kIniSetInt("Options", "ScrollRate", ScrollRate);
	D2kIniSetInt("Options", "GameSpeed", GameSpeed);
	D2kIniSetInt("Options", "GameBitsPerPixel", GameBitsPerPixel);
	D2kIniSetInt("Options", "SFXVolume", SFXVolume);
	D2kIniSetInt("Options", "MusicVolume", MusicVolume);
	D2kIniSetBool("Options", "MoviesEnabled", MoviesEnabled);
	D2kIniSetBool("Options", "SoundsEnabled", SoundsEnabled);
	D2kIniSetBool("Options", "SkipIntro", SkipIntro);
	D2kIniSetBool("Options", "VideoBackBuffer", VideoBackBuffer);
	D2kIniSetBool("Options", "DebugMode", DebugMode);
	D2kIniSetBool("Options", "ForceNoCD", ForceNoCD);

	D2kIniSetBool("WOL", "AllowFindUser", AllowFindUser);
	D2kIniSetBool("WOL", "AllowPageUser", AllowPageUser);
	D2kIniSetBool("WOL", "LanguageFilter", LanguageFilter);
	D2kIniSetBool("WOL", "ShowAllGames", ShowAllGames);
	D2kIniSetBool("WOL", "Microphone", Microphone);
	
	D2kIniSetInt("Hotkeys", "SelectAllUnits", SelectAllUnits);
	D2kIniSetInt("Hotkeys", "Scatter", Scatter);
	D2kIniSetInt("Hotkeys", "CenterNextUnit", CenterNextUnit);
	D2kIniSetInt("Hotkeys", "Repair", Repair);
	D2kIniSetInt("Hotkeys", "Sell", Sell);
	D2kIniSetInt("Hotkeys", "Guard", Guard);
	D2kIniSetInt("Hotkeys", "CenterBase", CenterBase);
	D2kIniSetInt("Hotkeys", "Stop", Stop);
	D2kIniSetInt("Hotkeys", "Bookmark1", Bookmark1);
	D2kIniSetInt("Hotkeys", "Bookmark2", Bookmark2);
	D2kIniSetInt("Hotkeys", "Bookmark3", Bookmark3);
	D2kIniSetInt("Hotkeys", "Bookmark4", Bookmark4);
	D2kIniSetInt("Hotkeys", "SidebarUp", SidebarUp);
	D2kIniSetInt("Hotkeys", "SidebarDown", SidebarDown);
	D2kIniSetInt("Hotkeys", "Alliance", Alliance);
	D2kIniSetInt("Hotkeys", "Retreat", Retreat);
	D2kIniSetInt("Hotkeys", "OptionsMenu", OptionsMenu);
	D2kIniSetInt("Hotkeys", "Team1", Team1);
	D2kIniSetInt("Hotkeys", "Team2", Team2);
	D2kIniSetInt("Hotkeys", "Team3", Team3);
	D2kIniSetInt("Hotkeys", "Team4", Team4);
	D2kIniSetInt("Hotkeys", "Team5", Team5);
	D2kIniSetInt("Hotkeys", "Team6", Team6);
	D2kIniSetInt("Hotkeys", "Team7", Team7);
	D2kIniSetInt("Hotkeys", "Team8", Team8);
	D2kIniSetInt("Hotkeys", "Team9", Team9);
	D2kIniSetInt("Hotkeys", "Team10", Team10);
	D2kIniSetInt("Hotkeys", "CTRL", CTRL);
	D2kIniSetInt("Hotkeys", "ALT", ALT);
	D2kIniSetInt("Hotkeys", "SHIFT", SHIFT);
	D2kIniSetInt("Hotkeys", "PrivateChat1", PrivateChat1);
	D2kIniSetInt("Hotkeys", "PrivateChat2", PrivateChat2);
	D2kIniSetInt("Hotkeys", "PrivateChat3", PrivateChat3);
	D2kIniSetInt("Hotkeys", "PrivateChat4", PrivateChat4);
	D2kIniSetInt("Hotkeys", "PrivateChat5", PrivateChat5);
	D2kIniSetInt("Hotkeys", "PublicChat", PublicChat);
	D2kIniSetInt("Hotkeys", "WOLPageReply", WOLPageReply);
	D2kIniSetInt("Hotkeys", "WOLProposeDraw", WOLProposeDraw);
	D2kIniSetInt("Hotkeys", "CenterSelectedUnits", CenterSelectedUnits);

	SaveDune2000Cfg();
}

void LoadDune2000Ini()
{
	LoadDune2000Cfg();
	
	NetUnitCount = D2kIniGetInt("MultiPlayer", "UnitCount", 10);
	NetTechLevel = D2kIniGetInt("MultiPlayer", "TechLevel", 7);
	NetStartingCredits = D2kIniGetInt("MultiPlayer", "StartingCredits", 7000);
	NetAIPlayers = D2kIniGetInt("MultiPlayer", "AIPlayers", 0);
	NetCrates = D2kIniGetBool("MultiPlayer", "Crates", false);
	NetWorms = D2kIniGetInt("MultiPlayer", "Worms", 0);
	D2kIniGetString("MultiPlayer", "PlayerName", "NONAME", NetPlayerName, 100);
	NetPlayerSide = D2kIniGetInt("MultiPlayer", "PlayerSide", 0);
	NetPlayerColor = D2kIniGetInt("MultiPlayer", "PlayerColor", 0);
	NetPlayerHandicap = D2kIniGetInt("MultiPlayer", "PlayerHandicap", 0);
	D2kIniGetString("MultiPlayer", "IPAddress", "", NetIPAddress, 100);
	D2kIniGetString("MultiPlayer", "ModemPhone", "", NetModemPhone, 100);
	NetSerialComPort = D2kIniGetInt("MultiPlayer", "SerialComPort", 1);

	FirstTimePlay = D2kIniGetBool("Options", "FirstTimePlay", true);
	ScrollRate = D2kIniGetInt("Options", "ScrollRate", 20);
	GameSpeed = D2kIniGetInt("Options", "GameSpeed", 75);
	GameBitsPerPixel = D2kIniGetInt("Options", "GameBitsPerPixel", 16);
	SFXVolume = D2kIniGetInt("Options", "SFXVolume", 100);
	MusicVolume = D2kIniGetInt("Options", "MusicVolume", 100);
	MoviesEnabled = D2kIniGetBool("Options", "MoviesEnabled", true);
	SoundsEnabled = D2kIniGetBool("Options", "SoundsEnabled", true);
	SkipIntro = D2kIniGetBool("Options", "SkipIntro", false);
	VideoBackBuffer = D2kIniGetBool("Options", "VideoBackBuffer", true);
	DebugMode = D2kIniGetBool("Options", "DebugMode", false);

	AllowFindUser = D2kIniGetBool("WOL", "AllowFindUser", true);
	AllowPageUser = D2kIniGetBool("WOL", "AllowPageUser", true);
	LanguageFilter = D2kIniGetBool("WOL", "LanguageFilter", false);
	ShowAllGames = D2kIniGetBool("WOL", "ShowAllGames", false);
	Microphone = D2kIniGetBool("WOL", "Microphone", false);
	
	SelectAllUnits = D2kIniGetInt("Hotkeys", "SelectAllUnits", 'E');
	Scatter = D2kIniGetInt("Hotkeys", "Scatter", 'X');
	CenterNextUnit = D2kIniGetInt("Hotkeys", "CenterNextUnit", 'N');
	Repair = D2kIniGetInt("Hotkeys", "Repair", 'T');
	Sell = D2kIniGetInt("Hotkeys", "Sell", 'Y');
	Guard = D2kIniGetInt("Hotkeys", "Guard", 'G');
	CenterBase = D2kIniGetInt("Hotkeys", "CenterBase", 'H');
	Stop = D2kIniGetInt("Hotkeys", "Stop", 'S');
	Bookmark1 = D2kIniGetInt("Hotkeys", "Bookmark1", VK_F9);
	Bookmark2 = D2kIniGetInt("Hotkeys", "Bookmark2", VK_F10);
	Bookmark3 = D2kIniGetInt("Hotkeys", "Bookmark3", VK_F11);
	Bookmark4 = D2kIniGetInt("Hotkeys", "Bookmark4", VK_F12);
	SidebarUp = D2kIniGetInt("Hotkeys", "SidebarUp", VK_UP);
	SidebarDown = D2kIniGetInt("Hotkeys", "SidebarDown", VK_DOWN);
	Alliance = D2kIniGetInt("Hotkeys", "Alliance", 'A');
	Retreat = D2kIniGetInt("Hotkeys", "Retreat", 'R');
	OptionsMenu = D2kIniGetInt("Hotkeys", "OptionsMenu", VK_ESCAPE);
	Team1 = D2kIniGetInt("Hotkeys", "Team1", '1');
	Team2 = D2kIniGetInt("Hotkeys", "Team2", '2');
	Team3 = D2kIniGetInt("Hotkeys", "Team3", '3');
	Team4 = D2kIniGetInt("Hotkeys", "Team4", '4');
	Team5 = D2kIniGetInt("Hotkeys", "Team5", '5');
	Team6 = D2kIniGetInt("Hotkeys", "Team6", '6');
	Team7 = D2kIniGetInt("Hotkeys", "Team7", '7');
	Team8 = D2kIniGetInt("Hotkeys", "Team8", '8');
	Team9 = D2kIniGetInt("Hotkeys", "Team9", '9');
	Team10 = D2kIniGetInt("Hotkeys", "Team10", '0');
	CTRL = D2kIniGetInt("Hotkeys", "CTRL", VK_CONTROL);
	ALT = D2kIniGetInt("Hotkeys", "ALT", VK_MENU);
	SHIFT = D2kIniGetInt("Hotkeys", "SHIFT", VK_SHIFT);
	PrivateChat1 = D2kIniGetInt("Hotkeys", "PrivateChat1", VK_F1);
	PrivateChat2 = D2kIniGetInt("Hotkeys", "PrivateChat2", VK_F2);
	PrivateChat3 = D2kIniGetInt("Hotkeys", "PrivateChat3", VK_F3);
	PrivateChat4 = D2kIniGetInt("Hotkeys", "PrivateChat4", VK_F4);
	PrivateChat5 = D2kIniGetInt("Hotkeys", "PrivateChat5", VK_F5);
	PublicChat = D2kIniGetInt("Hotkeys", "PublicChat", VK_F6);
	WOLPageReply = D2kIniGetInt("Hotkeys", "WOLPageReply", VK_F8);
	WOLProposeDraw = D2kIniGetInt("Hotkeys", "WOLProposeDraw", 'D');
	CenterSelectedUnits = D2kIniGetInt("Hotkeys", "CenterSelectedUnits", VK_HOME);
}


// ### Write ###
void D2kIniSetString(LPCTSTR section, LPCTSTR key, LPCTSTR value)
{
	IniSetString(section, key, value, dune2000Ini);
}

void D2kIniSetBool(LPCTSTR section, LPCTSTR key, bool value)
{
	IniSetBool(section, key, value, dune2000Ini);
}

void D2kIniSetInt(LPCTSTR section, LPCTSTR key, int value)
{
	IniSetInt(section, key, value, dune2000Ini);
}


// ### Read ###
void D2kIniGetString(LPCTSTR section, LPCTSTR key, LPCTSTR defaultValue, char *out, int length)
{
	IniGetString(section, key, defaultValue, dune2000Ini, out, length);
}

bool D2kIniGetBool(LPCTSTR section, LPCTSTR key, bool defaultValue)
{
	return IniGetBool(section, key, defaultValue, dune2000Ini);
}

int D2kIniGetInt(LPCTSTR section, LPCTSTR key, int defaultValue)
{
	return IniGetInt(section, key, defaultValue, dune2000Ini);
}
