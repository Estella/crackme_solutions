#include <windows.h>
extern void _stdcall d2dk_crackme05_hash(DWORD*, DWORD, DWORD*);


void hexprint(unsigned char* pin,int buflength,unsigned char* str)
{
	const char * hex = "0123456789ABCDEF";
	char * pout = str;
	int i = 0;
	for (; i < buflength - 1; ++i) {
		*pout++ = hex[(*pin >> 4) & 0xF];
		*pout++ = hex[(*pin++) & 0xF];
	}
	*pout++ = hex[(*pin >> 4) & 0xF];
	*pout++ = hex[(*pin) & 0xF];
	*pout = 0;

}

void process_serial(char *name, char *serial_out)
{
	unsigned char buffer_4034AB[32] = { 0 };
	unsigned char buffer_hashbuf[64] = { 0 };
	unsigned char hash_formatted[64] = { 0 };
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
	for(int counter = 0; counter != namelen;counter++)
	{
		ebx = ((DWORD)ebx & 0xFFFFFF00) | (DWORD)buffer_4034AB[counter] & 0xFF;
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
		buffer_4034AB[counter] = LOBYTE(edx);
		d2dk_crackme05_hash((DWORD*)buffer_4034AB, namelen, hashbuf_ptr);
		hashbuf_ptr_b = (char*)hashbuf_ptr;
		hashbuf_ptr_b += 10;
		ebx = *(DWORD*)hashbuf_ptr_b;
		edx ^= ebx;
		edx = _rotl(edx, 4);
		buffer_4034AB[counter] = LOBYTE(edx);
		d2dk_crackme05_hash((DWORD*)buffer_4034AB, namelen, hashbuf_ptr);
		ebx = 0x10101010;
		//debug print
		hexprint(buffer_hashbuf, 16, hash_formatted);
	}
	hexprint(buffer_hashbuf, 16, hash_formatted);
	wsprintf(serial_out, "%s", hash_formatted);
}