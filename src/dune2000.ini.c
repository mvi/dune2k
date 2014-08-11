#include <windows.h>
#include <macros/patch.h>
#include <vars/global.h>

CALL(0x00470BA0, _WriteDune2000Ini);
CALL(0x00470A68, _ReadDune2000Ini);

void WriteIni(LPCTSTR section, LPCTSTR key, LPCTSTR value, LPCTSTR fileName);

const LPCTSTR dune2000Ini = ".\\dune2000.ini";

void WriteDune2000Ini()
{
	//WriteIni("section","key","value", dune2000Ini);
	
	WriteDune2000Cfg();
}

void ReadDune2000Ini()
{
	ReadDune2000Cfg();
}
