#include <windows.h>
#include <macros/patch.h>
#include <vars/global.h>
#include <ini.h>

CALL(0x00470BA0, _SaveDune2000Ini);
CALL(0x00470A68, _LoadDune2000Ini);

LPCTSTR dune2000Ini = ".\\dune2000.ini";

void SaveDune2000Ini()
{
	D2kIniSetBool("MultiPlayer", "FirstTimePlay", FirstTimePlay);
	D2kIniSetInt("MultiPlayer", "UnitCount", NetUnitCount);
	D2kIniSetInt("MultiPlayer", "TechLevel", NetTechLevel);
	D2kIniSetInt("MultiPlayer", "StartingCredits", NetStartingCredits);
	D2kIniSetInt("MultiPlayer", "AIPlayers", NetAIPlayers);
	D2kIniSetBool("MultiPlayer", "Crates", NetCrates);
	D2kIniSetInt("MultiPlayer", "Worms", NetWorms);
	D2kIniSetString("MultiPlayer", "PlayerName", NetPlayerName);
	D2kIniSetInt("MultiPlayer", "PlayerSide", NetPlayerSide);
	D2kIniSetInt("MultiPlayer", "PlayerColor", NetPlayerColor);
	D2kIniSetString("MultiPlayer", "IPAddress", NetIPAddress);
	D2kIniSetString("MultiPlayer", "ModemPhone", NetModemPhone);
	D2kIniSetInt("MultiPlayer", "SerialComPort", NetSerialComPort);

	D2kIniSetInt("Options", "ScrollRate", ScrollRate);
	D2kIniSetInt("Options", "GameSpeed", GameSpeed);
	D2kIniSetInt("Options", "GameBitsPerPixel", GameBitsPerPixel);
	D2kIniSetInt("Options", "SFXVolume", SFXVolume);
	D2kIniSetInt("Options", "MusicVolume", MusicVolume);

	D2kIniSetBool("WOL", "AllowFindUser", AllowFindUser);
	D2kIniSetBool("WOL", "AllowPageUser", AllowPageUser);
	D2kIniSetBool("WOL", "LanguageFilter", LanguageFilter);
	D2kIniSetBool("WOL", "ShowAllGames", ShowAllGames);
	D2kIniSetBool("WOL", "Microphone", Microphone);

	SaveDune2000Cfg();
}

void LoadDune2000Ini()
{
	LoadDune2000Cfg();
	
	FirstTimePlay = D2kIniGetBool("MultiPlayer", "FirstTimePlay", true);
	NetUnitCount = D2kIniGetInt("MultiPlayer", "UnitCount", 10);
	NetTechLevel = D2kIniGetInt("MultiPlayer", "TechLevel", 7);
	NetStartingCredits = D2kIniGetInt("MultiPlayer", "StartingCredits", 7000);
	NetAIPlayers = D2kIniGetInt("MultiPlayer", "AIPlayers", 0);
	NetCrates = D2kIniGetBool("MultiPlayer", "Crates", false);
	NetWorms = D2kIniGetInt("MultiPlayer", "Worms", 0);
	D2kIniGetString("MultiPlayer", "PlayerName", "NONAME", NetPlayerName, 100);
	NetPlayerSide = D2kIniGetInt("MultiPlayer", "PlayerSide", 0);
	NetPlayerColor = D2kIniGetInt("MultiPlayer", "PlayerColor", 0);
	D2kIniGetString("MultiPlayer", "IPAddress", "", NetIPAddress, 100);
	D2kIniGetString("MultiPlayer", "ModemPhone", "", NetModemPhone, 100);
	NetSerialComPort = D2kIniGetInt("MultiPlayer", "SerialComPort", 1);

	ScrollRate = D2kIniGetInt("Options", "ScrollRate", 20);
	GameSpeed = D2kIniGetInt("Options", "GameSpeed", 75);
	GameBitsPerPixel = D2kIniGetInt("Options", "GameBitsPerPixel", 16);
	SFXVolume = D2kIniGetInt("Options", "SFXVolume", 100);
	MusicVolume = D2kIniGetInt("Options", "MusicVolume", 100);

	AllowFindUser = D2kIniGetBool("WOL", "AllowFindUser", true);
	AllowPageUser = D2kIniGetBool("WOL", "AllowPageUser", true);
	LanguageFilter = D2kIniGetBool("WOL", "LanguageFilter", false);
	ShowAllGames = D2kIniGetBool("WOL", "ShowAllGames", false);
	Microphone = D2kIniGetBool("WOL", "Microphone", false);
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
