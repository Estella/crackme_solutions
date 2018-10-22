#include <windows.h>

void process_serial(char *name, char *serial_out)
{
	unsigned char buffer[32]={0};
	byte bufctr=0;
	byte ctr = 0;
	char tabl[] = "SJKAZBVTECGIDFNG";
	int namelen = strlen(name);
	while(namelen)
	{
		unsigned char letter = toupper(name[ctr]);
		tabl[bufctr]=letter;
		bufctr+=2;
		ctr++;
		namelen--;
	}
	
	wsprintf(serial_out,"%s", tabl);
}


