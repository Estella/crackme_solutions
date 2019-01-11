#include <windows.h>
extern void d2dk_crackme05_hash(DWORD*, DWORD, BYTE*);

void process_serial(char *name, char *serial_out)
{
	unsigned char buffer_4034AB[32] = { 0 };
	unsigned char buffer_hashbuf[64] = { 0 };
	DWORD* hashbuf_ptr = (DWORD*)buffer_hashbuf;
	BYTE *hashbuf_ptr_b = (BYTE*)hashbuf_ptr;
	memcpy(buffer_4034AB, name, strlen(name));
	int namelen = strlen(name);
	
	for (int ecx = 0; ecx < namelen; ecx++)
	{
		int ebx = buffer_4034AB[ecx];
		ebx += namelen;
		int edx = *(DWORD *)buffer_4034AB;
		edx ^= ebx;
		buffer_4034AB[ecx] = (BYTE)edx;
	}

	
	int edx;
	int eax = namelen;
	int ebx = 0x10101010;
	int ecx = 0;

	while (ecx != namelen)
	{
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
		hashbuf_ptr_b += 6;
		ebx = *(DWORD*)hashbuf_ptr_b;
		edx ^= ebx;
		edx = _rotl(edx, 7);
		d2dk_crackme05_hash((DWORD*)buffer_4034AB, namelen, hashbuf_ptr);
		hashbuf_ptr_b = (char*)hashbuf_ptr;
		hashbuf_ptr_b += 8;
		ebx = *(DWORD*)hashbuf_ptr_b;
		edx ^= ebx;
		buffer_4034AB[ecx] = (((BYTE *)&ebx)[0]);
		d2dk_crackme05_hash((DWORD*)buffer_4034AB, namelen, hashbuf_ptr);
		hashbuf_ptr_b = (char*)hashbuf_ptr;
		hashbuf_ptr_b += 10;
		ebx = *(DWORD*)hashbuf_ptr_b;
		edx ^= ebx;
		edx = _rotl(edx, 4);
		buffer_4034AB[ecx] = (((BYTE *)&edx)[0]);
		d2dk_crackme05_hash((DWORD*)buffer_4034AB, namelen, hashbuf_ptr);
		ebx = 0x10101010;
		ecx++;
	}
	wsprintf(serial_out, "%s", name);
}