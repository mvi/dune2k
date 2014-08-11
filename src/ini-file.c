#include <windows.h>
	
typedef int (_stdcall *WritePrivateProfileStringA_)(LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpString, LPCTSTR lpFileName);
typedef int (_stdcall *IniReader)(LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpDefault, LPTSTR lpReturnedString, DWORD nSize, LPCTSTR lpFileName);

static HMODULE hModule;
static WritePrivateProfileStringA_ iniWriter;

void WriteIni(LPCTSTR section, LPCTSTR key, LPCTSTR value, LPCTSTR fileName)
{
	if (!hModule) hModule = LoadLibraryA("Kernel32.dll");
	if (!hModule) return;
	if (!iniWriter) iniWriter = (WritePrivateProfileStringA_)GetProcAddress(hModule,"WritePrivateProfileStringA");
	if (!iniWriter) return;
	iniWriter(section, key, value, fileName);
}
