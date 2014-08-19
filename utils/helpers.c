#include <windows.h>
#include <stdio.h>
#include <stdbool.h>

bool FileExists(char *fileName)
{
	FILE *file = fopen(fileName, "r");
    if (file)
    {
        fclose(file);
        return true;
    }
    return false;
}

bool StartsWith(const char *str, const char *value)
{
    size_t lstr = strlen(str), lvalue = strlen(value);
    return lstr < lvalue ? false : strncmp(value, str, lvalue) == 0;
}
