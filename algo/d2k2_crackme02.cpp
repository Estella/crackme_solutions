#include <windows.h>

void process_serial(char *name, char *serial_out)
{
	unsigned char buffer[32]={0};
	byte bufctr=0;
	char tabl[] = "SJKAZBVTECGIDFNG";
	int namelen = strlen(name);
	for (int ctr=0; ctr <namelen;ctr++)
	{
		tabl[bufctr]=toupper(name[ctr]);
		bufctr+=2;
	}
	wsprintf(serial_out,"%s", tabl);
}


