#include <windows.h>
#define setlobyte(val, b)val = (DWORD(val) & 0xFFFFFF00) | (DWORD(b) & 0xFF)
void process_serial(char *name, char *serial_out)
{
	unsigned char buffer_4034AB[32] = { 0 };
	memcpy(buffer_4034AB, name, strlen(name));
	int namelen = strlen(name);
	
	for (int ctr = 0; ctr < namelen; ctr++)
	{
		int ebx = buffer_4034AB[ctr];
		ebx += namelen;
		int edx = *(DWORD *)buffer_4034AB;
		edx ^= ebx;
		buffer_4034AB[ctr] = (BYTE)edx;
	}

	int ecx = 0;
	int edx;
	int eax;
	eax = namelen;
	int ebx = 0x10101010;
hashloop:
	eax = namelen;
	setlobyte(ebx, buffer_4034AB[ecx]);
	ebx <<= 5;
	edx = 0x68F6B76C;
	edx *= eax;
	ebx *= eax;
	edx ^= ebx;
	edx += *(DWORD *)buffer_4034AB;
	*(DWORD *)buffer_4034AB = edx;
	//call hash function


	wsprintf(serial_out, "%s", name);
}