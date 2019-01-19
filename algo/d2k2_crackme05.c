#include <windows.h>
extern void _stdcall d2k2_crackme05_hash(DWORD* input, DWORD input_len, DWORD* output);

void hexprint(unsigned char* pin, int buflength, unsigned char* str)
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

#define BUFFER_SIZE 0x40
void process_serial(char *name, char *serial_out)
{
	unsigned char hashinp[BUFFER_SIZE] = { 0 };
	unsigned char d2k2_hashout[BUFFER_SIZE] = { 0 };
	unsigned char d2k2hash_formatted[BUFFER_SIZE] = { 0 };
	DWORD* hashbuf_ptr = (DWORD*)d2k2_hashout;
	int namelen = strlen(name);
	lstrcpy(hashinp, name);

	for (int ctr = 0; ctr < namelen; ctr++)
	{
		int letter = hashinp[ctr] + namelen;
		int letter_xor = (*(DWORD *)hashinp) ^ letter;
		hashinp[ctr] = (BYTE)letter_xor;
	}

	for (int ctr = 0; ctr != namelen; ctr++)
	{
		BYTE *hashbuf_ptr_b = (BYTE*)d2k2_hashout;
		int magic1 = 0x10101010;
		int magic2 = 0x68F6B76C;
		magic1 = (((DWORD)magic1 & 0xFFFFFF00) | (DWORD)hashinp[ctr] & 0xFF) << 5;
		magic1 *= namelen;
		magic2 *= namelen;
		magic2 ^= magic1;
		magic2 += *(DWORD *)hashinp;
		*(DWORD *)hashinp = magic2;
		d2k2_crackme05_hash(hashinp, namelen, d2k2_hashout);
		hashbuf_ptr_b += 6;
		magic1 = *(DWORD*)hashbuf_ptr_b;
		magic2 ^= magic1;
		magic2 = _rotl(magic2, 7);
		hashbuf_ptr_b = (char*)hashbuf_ptr;
		hashbuf_ptr_b += 8;
		magic1 = *(DWORD*)hashbuf_ptr_b;
		magic2 ^= magic1;
		hashinp[ctr] = LOBYTE(magic2);
		d2k2_crackme05_hash(hashinp, namelen, d2k2_hashout);
		hashbuf_ptr_b = (char*)hashbuf_ptr;
		hashbuf_ptr_b += 10;
		magic1 = *(DWORD*)hashbuf_ptr_b;
		magic2 ^= magic1;
		magic2 = _rotl(magic2, 4);
		hashinp[ctr] = LOBYTE(magic2);
		d2k2_crackme05_hash(hashinp, namelen, d2k2_hashout);
	}

	for (int i = 0; i < 4; i++)
	{
		unsigned char text[9] = { 0 };
		wsprintf(text, "%1X", ((DWORD *)hashbuf_ptr[i]));
		strcat(d2k2hash_formatted, text);
	}
	int ebx = 0x10101010;
	int edx = 9;
	for (int i = 0; i < 0x20; i++)
	{
		ebx = ((DWORD)ebx & 0xFFFFFF00) | (DWORD)d2k2hash_formatted[i] & 0xFF;
		ebx = _rotl(ebx, 0x10);
		ebx = _byteswap_ulong(ebx) + 0x1A2B3C4D;
		ebx = _byteswap_ulong(ebx) ^ edx;
		int eax = ebx;
		edx = (eax >= 0) ? 0 : 0xFFFFFFFF;
		ebx = 0x19;
		edx = (eax % ebx) + 0x41;
		d2k2hash_formatted[i] = edx;
	}
	wsprintf(serial_out, "%s", d2k2hash_formatted);
}
