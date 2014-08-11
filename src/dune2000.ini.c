#include <windows.h>
#include <macros/patch.h>
#include <vars/global.h>
#include <ini-file.h>

CALL(0x00470BA0, _SaveDune2000Ini);
CALL(0x00470A68, _LoadDune2000Ini);

const LPCTSTR dune2000Ini = ".\\dune2000.ini";

void SaveDune2000Ini()
{
	//WriteIni("section","key","value", dune2000Ini);
	
	SaveDune2000Cfg();
}

void LoadDune2000Ini()
{
	LoadDune2000Cfg();
}
