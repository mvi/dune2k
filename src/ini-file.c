#include <windows.h>

typedef int (_stdcall *IniWriter)(LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpString, LPCTSTR lpFileName);
typedef int (_stdcall *IniReader)(LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpDefault, LPTSTR lpReturnedString, DWORD nSize, LPCTSTR lpFileName);

void WriteIni(LPCTSTR section, LPCTSTR key, LPCTSTR value, LPCTSTR fileName)
{
	HMODULE hModule;
	IniWriter iniWriter;
	hModule = LoadLibraryA("Kernel32.dll");
	if (hModule == NULL) return;
	iniWriter = (IniWriter)GetProcAddress(hModule,"WritePrivateProfileStringA");
	if (iniWriter == NULL) return;
	iniWriter(section, key, value, fileName);
}
