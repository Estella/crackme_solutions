#include <windows.h>
#include <stdbool.h>


void process_serial(char *name, char *serial_out)
{
	const char* validchar_tbl = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	wsprintf(serial_out, "%s", "TEST");
}