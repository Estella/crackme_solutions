#include <windows.h>

/*
This particular crackme uses Yoda's Protector for DRM. 
You might need to use Scyllahide or x64dbg's Patch PEB
functions.

To unpack, load up crackme in x32dbg, place an 
singleshot memory breakpoint on execution on the
"code" PE section.

Then use Scylla to rebuild imports, etc.
*/

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
	ctr1 = _byteswap_ulong(ctr1);
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


