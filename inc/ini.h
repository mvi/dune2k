#include <stdbool.h>

// ### Write ###
void IniSetString(LPCTSTR section, LPCTSTR key, LPCTSTR value, LPCTSTR fileName);
void IniSetBool(LPCTSTR section, LPCTSTR key, bool value, LPCTSTR fileName);
void IniSetInt(LPCTSTR section, LPCTSTR key, int value, LPCTSTR fileName);

//dune2000.ini
void D2kIniSetString(LPCTSTR section, LPCTSTR key, LPCTSTR value);
void D2kIniSetBool(LPCTSTR section, LPCTSTR key, bool value);
void D2kIniSetInt(LPCTSTR section, LPCTSTR key, int value);


// ### Read ###
void IniGetString(LPCTSTR section, LPCTSTR key, LPCTSTR defaultValue, LPCTSTR fileName, char *out, int length);
bool IniGetBool(LPCTSTR section, LPCTSTR key, bool defaultValue, LPCTSTR fileName);
int IniGetInt(LPCTSTR section, LPCTSTR key, int defaultValue, LPCTSTR fileName);

//dune2000.ini
void D2kIniGetString(LPCTSTR section, LPCTSTR key, LPCTSTR defaultValue, char *out, int length);
bool D2kIniGetBool(LPCTSTR section, LPCTSTR key, bool defaultValue);
int D2kIniGetInt(LPCTSTR section, LPCTSTR key, int defaultValue);
