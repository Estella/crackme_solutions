//https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher



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
unsigned char* buildsertable(int start_pos,char* table)
{
	int serialen = strlen(table);
	int posit = start_pos;
	char* newtbl = (char*)malloc(serialen+ 1);
	memset(newtbl, 0, serialen + 1);
	for (int i = 0; i < serialen; i++)
		newtbl[i] = table[posit++ % serialen];
	return newtbl;
}

unsigned findcharintab(char* table,int let)
{
	for (int i = 0; i < strlen(validchar_tbl); i++)
	{
		if(table[i]==let)
		return i;
	}
	return 0;
}

void process_serial(char* name, char* serial_out)
{
	int strlen_serialshit = strlen(name);
	char* serialshit_compute = (char*)malloc(strlen_serialshit + 1);
	char* serialshit = (char*)malloc(strlen_serialshit + 1);
	memset(serialshit, 0, strlen_serialshit + 1);
	memset(serialshit_compute, 0, strlen_serialshit + 1);

	int shitvar1 = strlen_serialshit << 2;
	if (shitvar1 >= 0x3C)shitvar1 = 0x1E;
	unsigned char* shitstring1 = buildsertable(shitvar1,validchar_tbl);
	int strlen_shitstring1 = strlen(shitstring1);
	int shit1_len = strlen_shitstring1;

	Register  AL;
	uint8_t DL= 0;
	AL.rx = 0;

	DL = name[0];
	DL = _rotl8(DL, 3);



	for (int i = 0; ; i++)
	{
		int j = i + 1;
		AL.b.lo = name[i];
		AL.b.lo ^= name[j];
		AL.b.lo += DL;
		DL += AL.b.lo;
		int res2 = AL.b.lo % strlen_shitstring1;
		AL.b.lo = shitstring1[res2];
		serialshit_compute[i] = AL.b.lo;
		if (j == strlen_serialshit)break;
	}

	for (int i = 0; i < strlen_serialshit; i++)
	{
		int offset = findcharintab(shitstring1,serialshit_compute[i]);
		unsigned char* shitstring = buildsertable(offset,shitstring1);
		int offset2 = findcharintab(shitstring1, name[i]);
		serialshit[i] = shitstring[offset2];
		free(shitstring);
	}
	free(shitstring1);
	free(serialshit_compute);
	wsprintf(serial_out, "%s", serialshit);
	free(serialshit);
}