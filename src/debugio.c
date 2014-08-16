#include <debugio.h>

int printf(const char *fmt, ...)
{
    static char buf[512];
    va_list ap;

    va_start(ap, fmt);
    vsprintf(buf, fmt, ap);
    va_end(ap);

    return puts(buf);
}

int dprintf(const char *fmt, ...)
{
    static char buf[512];
    va_list ap;

    va_start(ap, fmt);
    vsprintf(buf, fmt, ap);
    va_end(ap);

    OutputDebugStringA(buf);

    return 0;
}

int puts(const char *s)
{
    return WriteFile(GetStdHandle(STD_OUTPUT_HANDLE), s, strlen(s) + 1, NULL, NULL) ? 0 : -1;
}
