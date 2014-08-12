#define _CRTIMP
#include <windows.h>
#include <stdbool.h>
#include <stdio.h>

typedef int (_stdcall *WritePrivateProfileStringA_)(LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpString, LPCTSTR lpFileName);
typedef int (_stdcall *GetPrivateProfileStringA_)(LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpDefault, LPTSTR lpReturnedString, DWORD nSize, LPCTSTR lpFileName);

static HMODULE hModule;
static WritePrivateProfileStringA_ writeIni;
static GetPrivateProfileStringA_ readIni;

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
	char result[10];
	sprintf(result,"%d",value);
	IniSetString(section, key, result, fileName);
}


LPTSTR IniGetString(LPCTSTR section, LPCTSTR key, LPCTSTR defaultValue, LPCTSTR fileName)
{
	if (!hModule) hModule = LoadLibraryA("Kernel32.dll");
	if (!hModule) return (LPTSTR)defaultValue;
	if (!readIni) readIni = (GetPrivateProfileStringA_)GetProcAddress(hModule,"GetPrivateProfileStringA");
	if (!readIni) return (LPTSTR)defaultValue;
	
	char buffer[255];
	readIni(section, key, defaultValue, buffer, 255, fileName);
	
	char *result = malloc(255);
	strcpy(result, buffer);
	
	return result;
}

bool IniGetBool(LPCTSTR section, LPCTSTR key, bool defaultValue, LPCTSTR fileName)
{
	LPTSTR value = IniGetString(section, key, defaultValue ? "Yes" : "No", fileName);
	
	char *p;
	for (p = value; *p != '\0'; ++p) *p = tolower(*p);
	
	bool result = (!strcmp(value, "yes") || !strcmp(value, "true") || !strcmp(value, "1"));
	free(value);
	
	return result;
}

int IniGetInt(LPCTSTR section, LPCTSTR key, int defaultValue, LPCTSTR fileName)
{
	char dvalue[10];
	sprintf(dvalue,"%d", defaultValue);
	LPTSTR value = IniGetString(section, key, dvalue, fileName);
	
	int result = atoi(value);
	free(value);
	
	return result;
}
