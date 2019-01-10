#include <windows.h>
extern void d2dk_crackme05_hash(DWORD*, DWORD, BYTE*);

void process_serial(char *name, char *serial_out)
{
	unsigned char buffer_4034AB[32] = { 0 };
	unsigned char buffer_hashbuf[64] = { 0 };
	DWORD* hashbuf_ptr = (DWORD*)buffer_hashbuf;
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
	(((BYTE *)&ebx)[0]) = buffer_4034AB[ecx];
	ebx <<= 5;
	edx = 0x68F6B76C;
	edx *= eax;
	ebx *= eax;
	edx ^= ebx;
	edx += *(DWORD *)buffer_4034AB;
	*(DWORD *)buffer_4034AB = edx;
	//call hash function
	d2dk_crackme05_hash((DWORD*)buffer_4034AB, namelen, hashbuf_ptr);
	DWORD *ptr = (BYTE*)hashbuf_ptr + 6;
	ebx = (*ptr);
	wsprintf(serial_out, "%s", name);
}