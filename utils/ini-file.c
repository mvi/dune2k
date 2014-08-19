#define _CRTIMP
#include <windows.h>
#include <stdbool.h>
#include <stdio.h>

typedef int (_stdcall *WritePrivateProfileStringA_)(LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpString, LPCTSTR lpFileName);
typedef int (_stdcall *GetPrivateProfileStringA_)(LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpDefault, LPTSTR lpReturnedString, DWORD nSize, LPCTSTR lpFileName);

static HMODULE hModule;
static WritePrivateProfileStringA_ writeIni;
static GetPrivateProfileStringA_ readIni;

// ### Write ###
void IniSetString(LPCTSTR section, LPCTSTR key, LPCTSTR value, LPCTSTR fileName)
{
	if (!hModule) hModule = LoadLibraryA("Kernel32.dll");
	if (!hModule) return;
	if (!writeIni) writeIni = (WritePrivateProfileStringA_)GetProcAddress(hModule,"WritePrivateProfileStringA");
	if (!writeIni) return;
	writeIni(section, key, value, fileName);
}

void IniSetBool(LPCTSTR section, LPCTSTR key, bool value, LPCTSTR fileName)
{
	IniSetString(section, key, value ? "Yes" : "No", fileName);
}

void IniSetInt(LPCTSTR section, LPCTSTR key, int value, LPCTSTR fileName)
{
	char result[11];
	sprintf(result,"%d",value);
	IniSetString(section, key, result, fileName);
}


// ### Read ###
void IniGetString(LPCTSTR section, LPCTSTR key, LPCTSTR defaultValue, LPCTSTR fileName, char *out, int length)
{
	if (!hModule) hModule = LoadLibraryA("Kernel32.dll");
	if (!hModule)
	{
		strcpy(out, defaultValue);
		return;
	}
	if (!readIni) readIni = (GetPrivateProfileStringA_)GetProcAddress(hModule,"GetPrivateProfileStringA");
	if (!readIni)
	{
		strcpy(out, defaultValue);
		return;
	}
	readIni(section, key, defaultValue, out, length, fileName);
}

bool IniGetBool(LPCTSTR section, LPCTSTR key, bool defaultValue, LPCTSTR fileName)
{
	char value[5];
	IniGetString(section, key, defaultValue ? "Yes" : "No", fileName, value, 5);
	
	char *p;
	for (p = value; *p != '\0'; ++p) *p = tolower(*p);
	
	return (!strcmp(value, "yes") || !strcmp(value, "true") || !strcmp(value, "1"));
}

int IniGetInt(LPCTSTR section, LPCTSTR key, int defaultValue, LPCTSTR fileName)
{
	char dvalue[11];
	sprintf(dvalue,"%d", defaultValue);
	char value[11];
	IniGetString(section, key, dvalue, fileName, value, 11);
	
	return atoi(value);
}
