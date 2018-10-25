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
	char tabl[] = "SJKAZBVTECGIDFNG";
	int namelen = strlen(name);
	int ctr=0,bufctr=0,magic_dword = 0;
	while(ctr != namelen)
	{
		tabl[bufctr]=toupper(name[ctr++]);
		bufctr+=2;
	}

    ctr=0;
	while(ctr !=0x10)
		magic_dword += tabl[ctr++];
		
	magic_dword *= (namelen * 0xFF);
	magic_dword ^= 0xACEBDFAB;
	magic_dword = _byteswap_ulong(magic_dword);
	wsprintf((char*)ctr1_buf,"%1X", magic_dword);

    ctr=0;
    while (ctr != 8)
	{
	  if(ctr1_buf[ctr] < 0x3A)
	    ctr1_buf[ctr] = (ctr1_buf[ctr]+ 0x11);
	  ctr++;
    }

	ctr=0;
	bufctr=0;
	while (bufctr != 0x10)
	{
	  tabl[bufctr+1]=ctr1_buf[ctr++]+5;
	  bufctr+=2;
	}
	wsprintf(serial_out,"%s", tabl);
}


