#include <windows.h>
#include <stdbool.h>
#include <stdint.h>

typedef union
{
	uint64_t rx;
	uint32_t ex;
	uint16_t x;
	struct { uint8_t lo, hi; }b;
} Register;

const char* validchar_tbl = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

unsigned char* buildsertable(int start_pos)
{
	int serialen = strlen(validchar_tbl);
	int posit = start_pos;
	char* newtbl = (char*)malloc(serialen+ 1);
	memset(newtbl, 0, serialen + 1);
	for (int i = 0; i < serialen; i++)
	{
		if (posit >= serialen)posit = 0;
		newtbl[i] = validchar_tbl[posit];
		posit = posit + 1 % serialen;
	}
	return newtbl;
}

void process_serial(char* name, char* serial_out)
{
	
	unsigned char nameshit[] = "FUCKGWF";
	unsigned char serialshit[] = "D1CZYOU1";
	/*
	for (int i = 0; i < strlen(nameshit); i++)
	{
		nameshit[i] = validchar_tbl[rand() % serialen];
	}*/

	int shitvar1 = strlen(nameshit) << 2;
	if (shitvar1 >= 0x3C)shitvar1 = 0x1E;
	unsigned char* shitstring1 = buildsertable(shitvar1);
	wsprintf(serial_out, "%s", shitstring1);
	int strlen_shitstring1 = strlen(shitstring1);
	int shit1_len = strlen_shitstring1;

	Register  AL;
	uint8_t DL= 0;
	AL.rx = 0;

	DL = nameshit[0];
	DL = _rotl8(DL, 3);
	for (int i = 0; i < shit1_len; i++)
	{
		AL.b.lo = nameshit[i];
		AL.b.lo ^= nameshit[i + 1];
		AL.b.lo += DL;
		DL += AL.b.lo;

		int res = AL.ex / DL;
		unsigned char str = shitstring1[res + DL];
	}

	
	strlen_shitstring1 ^= nameshit[1];
	free(shitstring1);

	wsprintf(serial_out, "%s", "TEST");
}