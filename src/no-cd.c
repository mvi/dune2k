#include <vars/global.h>
#include <macros/patch.h>
#include <ini.h>

CLEAR(0x004035EE, 0x90, 0x00403601);
LJMP(0x004035EE, 0x00403601);
CALL(0x0042B7EA, _LoadNoCDSetting);

void Get_CD(char *arg);

void LoadNoCDSetting(char *arg)
{
	ForceNoCD = D2kIniGetBool("Options", "ForceNoCD", true);
	Get_CD(arg);
}
