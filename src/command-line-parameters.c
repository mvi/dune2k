#define _CRTIMP
#include <windows.h>
#include <stdbool.h>
#include <macros/patch.h>
#include <vars/global.h>

CALL(0x004A3BF1, _ParseCommandLine);

void ParseCommandLine(char *args)
{
	char *s = strtok(args," ");
	while (s != NULL)
	{
		for(unsigned int i = 0, l = strlen(s); i < l; i++)
			if(s[i] == '"') strcpy(s + i, s + i + 1);
		
		char *p;
		for (p = s; *p != '\0'; ++p) *p = tolower(*p);
		
		if (!strcmp(s, "-window")) FullScreen = false;
		else if (!strcmp(s, "-g")) Force480Height = true;

		s = strtok(NULL, " ");
	}
}
