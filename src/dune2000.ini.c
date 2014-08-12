#include <windows.h>
#include <macros/patch.h>
#include <vars/global.h>
#include <ini-file.h>

CALL(0x00470BA0, _SaveDune2000Ini);
CALL(0x00470A68, _LoadDune2000Ini);

LPCTSTR dune2000Ini = ".\\dune2000.ini";

void SaveDune2000Ini()
{
	//IniSetString("section","key","value", dune2000Ini);
	//IniSetBool("section","key", true, dune2000Ini);
	//IniSetInt("section","key", 24563187, dune2000Ini);
	
	//LPTSTR test = IniGetString("section", "key", "herpaDerp", dune2000Ini);
	//bool test = IniGetBool("section", "key", false, dune2000Ini);
	//int test = IniGetInt("section", "key", 2555, dune2000Ini);
	
	//OutputDebugStringA("");
	
	SaveDune2000Cfg();
}

void LoadDune2000Ini()
{
	LoadDune2000Cfg();
}
