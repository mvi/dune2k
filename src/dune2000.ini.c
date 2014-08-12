#include <windows.h>
#include <macros/patch.h>
#include <vars/global.h>
#include <ini.h>

CALL(0x00470BA0, _SaveDune2000Ini);
CALL(0x00470A68, _LoadDune2000Ini);

LPCTSTR dune2000Ini = ".\\dune2000.ini";

void SaveDune2000Ini()
{
	//IniSetString("section","key","value", dune2000Ini);
	//IniSetBool("section","key", true, dune2000Ini);
	//IniSetInt("section","key", 24563187, dune2000Ini);

	//IniGetString("section", "key", "herpaDerp", dune2000Ini, test, 50);
	//bool test = IniGetBool("section", "key", false, dune2000Ini);
	//int test = IniGetInt("section", "key", 2555, dune2000Ini);
	
	//D2kIniSetString("section","key","value");
	//D2kIniSetBool("section","key", true);
	//D2kIniSetInt("section","key", 24563187);
	
	//D2kIniGetString("section", "key", "herpaDerp", test, 50);
	//bool test = D2kIniGetBool("section", "key", false);
	//int test = D2kIniGetInt("section", "key", 2555);
	
	
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


	//OutputDebugStringA(test);
	
	SaveDune2000Cfg();
}

void LoadDune2000Ini()
{
	LoadDune2000Cfg();
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
