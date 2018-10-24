#include <windows.h>

void process_serial(char *name, char *serial_out)
{
	unsigned char buffer[32]={0};
	unsigned char ctr1_buf[8]={0};
	char tabl[] = "SJKAZBVTECGIDFNG ";
	int namelen = strlen(name);
	int ctr=0,bufctr=0;
	for (ctr=0, bufctr=0; ctr <namelen;ctr++,bufctr+=2)
		tabl[bufctr]=toupper(name[ctr]);

	int ctr1 = 0;
	for (ctr=0; ctr <0x10;ctr++)
		ctr1 += tabl[ctr];
	ctr1 *= (namelen * 0xFF);
	ctr1 ^= 0xACEBDFAB;
	ctr1 = ((ctr1>>24)&0xff) | 
		((ctr1<<8)&0xff0000) | 
		((ctr1>>8)&0xff00) | 
		((ctr1<<24)&0xff000000);
	wsprintf((char*)ctr1_buf,"%1X", ctr1);


     ctr=0;
     while (ctr != 8)
     {
	  if(ctr1_buf[ctr] < 0x3A)
		ctr1_buf[ctr] = ctr1_buf[ctr]+ 0x11;
	  ctr++;
     }

	 ctr=0;
	 bufctr=0;
	 while (bufctr != 0x10)
	 {
		 tabl[bufctr+1]=ctr1_buf[ctr]+5;
		 bufctr+=2;
		 ctr++;
	 }

	wsprintf(serial_out,"%s", tabl);
}


