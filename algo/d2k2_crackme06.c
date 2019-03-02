#include <windows.h>
#include <stdint.h>
extern void _stdcall d2k2_crackme06_unknown128bhash(DWORD* input, DWORD input_len, DWORD* output);
extern void _stdcall d2k2_crackme06_unknownhash2(DWORD* output, DWORD input_len, DWORD* input);
extern void _stdcall d2k2_crackme06_haval(DWORD* output, DWORD input_len, DWORD* input);
unsigned int d2k2_magic1; //variable needed for unknown hash function.

typedef union
{
	uint64_t rx;
	uint32_t ex;
	uint16_t x;
	struct { uint8_t lo, hi; }b;
} Register;

#define BUFFER_SIZE 0x80

static const unsigned int crc32tab[16] = {
	0x00000000, 0x1DB71064, 0x3B6E20C8, 0x26D930AC, 0x76DC4190,
	0x6B6B51F4, 0x4DB26158, 0x5005713C, 0xEDB88320, 0xF00F9344,
	0xD6D6A3E8, 0xCB61B38C, 0x9B64C2B0, 0x86D3D2D4, 0xA00AE278,
	0xBDBDF21C
};

unsigned int crc32(const void *data, unsigned int length, int magic)
{
	const unsigned char *buf = (const unsigned char *)data;
	unsigned int crc = 0xFFFFFFFF;
	unsigned int i;
	for (i = 0; i < length; ++i) {
		crc ^= buf[i];
		crc = crc32tab[crc & 0x0F] ^ (crc >> 4);
		crc = crc32tab[crc & 0x0F] ^ (crc >> 4);
	}
	crc ^= magic;
	return crc ^ 0xFFFFFFFF;
}

char base36enc(int num)
{
	//pick a char from the table according to the input hex number
	const char  *base36 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	return (base36[num]);
}


void process_serial(char *name, char *serial_out)
{
	unsigned char havalbuf1[BUFFER_SIZE] = { 0 };
	unsigned char havalbuf2[BUFFER_SIZE] = { 0 };
	char d2k2_testtable[0x130] = { 0 };
	unsigned char d2k2_crackme06_serial[0x11] = { 0 };

	unsigned char inputbuf1[0x40] = { 0 };
	size_t namelen = strlen(name);
	memcpy(inputbuf1, name, namelen);
	d2k2_magic1 = 0xABCDEFAC;

	DWORD d2k2_magic2[2] = { 0xC3F801AF,0 };

	Register EB, EC, EA, ED;
	EC.ex = 0;
	EB.ex = 0;
	ED.ex = namelen;
	EA.ex = namelen;
	//first portion

	for (int i = 0; i < namelen; i++)
	{
		BYTE* d2k2_unk1hashptr = havalbuf1;
		d2k2_crackme06_unknown128bhash(inputbuf1, namelen, havalbuf1);
		EB.b.lo = inputbuf1[i];
		EB.b.lo += i;
		EB.b.lo ^= namelen;
		havalbuf1[i] += EB.b.lo;
		EA.ex = *(DWORD*)(d2k2_unk1hashptr + 0x05);
		EB.ex = *(DWORD*)(d2k2_unk1hashptr + 0x04);
		EA.ex = EA.ex + EB.ex + 0x2004;
		EA.ex = i + EA.ex + 0x4064C7;
		d2k2_magic1 = EA.ex;
		EB.b.lo ^= EA.b.lo;
		inputbuf1[i] += EB.b.lo;
	}
	d2k2_crackme06_haval(havalbuf2, namelen, inputbuf1);
	//second portion

	int8_t testvector[0x100] =
	{
		0x24, 0xA6, 0x85, 0x4C, 0x7E, 0xC4, 0x3D, 0x10, 0x0B, 0x3D, 0x5C, 0xBD, 0x17, 0x5D, 0x14, 0x81,
		0x4C, 0x9D, 0xAE, 0xFB, 0x57, 0xC2, 0x37, 0x85, 0xD2, 0x7C, 0x0C, 0x06, 0xCD, 0xE2, 0x95,0x8F,
		0xC8, 0x99, 0x57, 0x3E, 0xB0, 0xB9, 0x63, 0x25, 0xB2, 0xFF, 0xB9, 0xB4, 0xA6, 0x23, 0xC6, 0x9B,
		0xDC, 0x82, 0xE7, 0x90, 0x04, 0x8E, 0xF0, 0xD7, 0x74, 0xD2, 0xF6, 0x73, 0xAC, 0x5E, 0x80, 0xBA,
		0xF4, 0x8B, 0x01, 0xEA, 0x8C, 0x0D, 0x88, 0x83, 0xD1, 0x0F, 0x48, 0x3E, 0xAB, 0x91, 0x4E, 0xD8,
		0x14, 0xC9, 0xC5, 0x9E, 0x2A, 0xF5, 0x91, 0x07, 0x2D, 0xE5, 0xA0, 0xDF, 0x13, 0xD1, 0xEC, 0x48,
		0x64, 0xCC, 0x4C, 0xDC, 0x97, 0xA6, 0x02, 0x1B, 0xA1, 0x13, 0xAF, 0x63, 0xD2, 0x6D, 0xE5, 0xA2, //
		0x5C, 0xC7, 0x95, 0x8B, 0x98, 0xD5, 0x34, 0xED, 0x70, 0x27, 0x5A, 0x90, 0x8C, 0x75, 0x79, 0xF2,
		0x74, 0x39, 0x1A, 0x36, 0x9E, 0xA0, 0xAB, 0x5F, 0x0F, 0x72, 0x65, 0x52, 0x73, 0x99, 0x76, 0x7C,
		0x18, 0xAB, 0x25, 0x0E, 0x54, 0x25, 0x6F, 0xAF, 0xF3, 0xDA, 0xA5, 0x2B, 0x0F, 0x15, 0xEF, 0xCC,
		0x78, 0xBD, 0x43, 0xCC, 0xB3, 0x1D, 0x5E, 0x83, 0x85, 0x56, 0x0D, 0x50, 0x46, 0x77, 0xA8, 0x06,
		0xF8, 0x34, 0x5E, 0xE5, 0xC1, 0x2C, 0xAF, 0x42, 0x51, 0xC0, 0x17, 0x49, 0xA6, 0xB7, 0xE8, 0xA6,
		0x28, 0xF1, 0xA2, 0x9B, 0xDA, 0x9C, 0xDA, 0x33, 0xE1, 0x30, 0x83, 0xDA, 0x15, 0x5C, 0x3B, 0x72,
		0xA0, 0xA0, 0x12, 0x37, 0xD7, 0x9E, 0xAE, 0xF1, 0x9C, 0x9E, 0xA9, 0x63, 0xD3, 0x9C, 0xC5, 0x1E,
		0x6C, 0x9D, 0xE9, 0x84, 0xDA, 0x4F, 0x2B, 0xE8, 0x2E, 0x88, 0xB0, 0x06, 0x98, 0x72, 0x72, 0x6A,
		0x1C, 0xDE, 0xC9, 0xA9, 0xDB, 0x3F, 0xFF, 0x63, 0xE1, 0xD6, 0x31, 0xCE, 0x9C, 0x30, 0x67, 0x88

	};

	EA.ex = 0x004063AD;
	DWORD* d2k2_testtblptr = d2k2_testtable;
	DWORD* d2k2_testvecptr = testvector;
	int test = 0;
	for (int i = 0; i != 0x10; i++)
	{

		EB.ex = (int8_t)havalbuf1[i];
		ED.ex = (int8_t)havalbuf2[i];
		EB.ex += d2k2_magic1;
		EB.ex ^= ED.ex;
		EB.ex = (EB.ex * 4) + 0x1024;
		*(DWORD*)(d2k2_testtblptr++) = EB.ex;
		EB.ex += d2k2_magic2[0];
		EB.ex ^= EA.ex;
		EB.ex ^= i;
		*(DWORD*)(d2k2_testtblptr++) = EB.ex;
		EB.ex += d2k2_magic1;
		EB.ex ^= EA.ex;
		EB.ex ^= i;
		*(DWORD*)(d2k2_testtblptr++) = EB.ex;
		EB.ex += d2k2_magic2[0];
		EB.ex ^= EA.ex;
		EB.ex ^= i;
		*(DWORD*)(d2k2_testtblptr++) = EB.ex;
		d2k2_magic1 = EB.ex;
		havalbuf1[i] = EB.b.lo;


		//extern void _stdcall d2k2_crackme06_unknownhash(DWORD* input, DWORD input_len, DWORD* output);
		//extern void _stdcall d2k2_crackme06_unknownhash2(DWORD* output, DWORD input_len, DWORD* input);
		//extern void _stdcall d2k2_crackme06_haval(DWORD* output, DWORD input_len, DWORD* input);

		d2k2_crackme06_haval(havalbuf1, 0x10, havalbuf2);
		d2k2_crackme06_unknown128bhash(havalbuf1, 0x10, havalbuf2);
		//	d2k2_crackme06_unknownhash2(d2k2_magic2, 0x10, d2k2_havalhashout1);

		havalbuf2[i] = (BYTE)crc32(havalbuf2, 0x10, d2k2_magic2[0]);


		if (memcmp(&d2k2_testtable[test], &d2k2_testtable[test], 0x10) == 0)
		{
			wsprintf(serial_out, "%s", "pass!");
		}
		else
			wsprintf(serial_out, "%s", "fail!");
		EA.ex += 0x10;
		test += 0x10;
	}

	for (int i = 0; i < 0x10; i++)
	{
		d2k2_crackme06_serial[i] = base36enc(rand() % 36);
	}

	lstrcpy(d2k2_crackme06_serial, "A22GRIMIWULQGU5J");


	//int test1 = d2k2_testbuf[0];

	char str[] = "FU";
	d2k2_testtable[0] ^= d2k2_crackme06_serial[0];
	wsprintf(str, "%2.2X", d2k2_testtable[0]);
	d2k2_crackme06_serial[0x02] = str[1];

	d2k2_testtable[0x57] ^= d2k2_crackme06_serial[0x06];
	wsprintf(str, "%2.2X", d2k2_testtable[0x57]);
	d2k2_crackme06_serial[0x01] = str[1];

	d2k2_testtable[0x38] ^= d2k2_crackme06_serial[0x0D];
	wsprintf(str, "%2.2X", d2k2_testtable[0x38]);
	d2k2_crackme06_serial[0x04] = str[1];

	d2k2_testtable[0x70] ^= d2k2_crackme06_serial[0x09];
	wsprintf(str, "%2.2X", d2k2_testtable[0x70]);
	d2k2_crackme06_serial[0x07] = str[1];

	d2k2_testtable[0xCD] ^= d2k2_crackme06_serial[0x0F];
	wsprintf(str, "%2.2X", d2k2_testtable[0xCD]);
	d2k2_crackme06_serial[0x08] = str[1];



	wsprintf(serial_out, "%s", d2k2_crackme06_serial);








}
