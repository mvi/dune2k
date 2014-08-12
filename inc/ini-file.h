#include <stdbool.h>

//Write
void IniSetString(LPCTSTR section, LPCTSTR key, LPCTSTR value, LPCTSTR fileName);
void IniSetBool(LPCTSTR section, LPCTSTR key, bool value, LPCTSTR fileName);
void IniSetInt(LPCTSTR section, LPCTSTR key, int value, LPCTSTR fileName);

//Read
LPTSTR IniGetString(LPCTSTR section, LPCTSTR key, LPCTSTR defaultValue, LPCTSTR fileName);
bool IniGetBool(LPCTSTR section, LPCTSTR key, bool defaultValue, LPCTSTR fileName);
int IniGetInt(LPCTSTR section, LPCTSTR key, int defaultValue, LPCTSTR fileName);
