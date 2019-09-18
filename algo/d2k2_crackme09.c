//https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher
#include <windows.h>
#include <stdbool.h>
#include <stdint.h>

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
	int seriallen = strlen(name);
	char* key = (char*)malloc(seriallen + 1);
	char* ciphertext = (char*)malloc(seriallen + 1);
	memset(ciphertext, 0, seriallen + 1);
	memset(key, 0, seriallen + 1);

	int shlvar = seriallen << 2;
	if (shlvar >= 0x3C)shlvar = 0x1E;
	unsigned char* subtable1 = buildsertable(shlvar,validchar_tbl);
	int subtbl1len = strlen(subtable1);

	uint8_t AL=0;
	uint8_t DL= 0;
	DL = name[0];
	DL = _rotl8(DL, 3);
	for (int i = 0; ; i++)
	{
		int j = i + 1;
		AL = name[i];
		AL ^= name[j];
		AL += DL;
		DL += AL;
		AL = subtable1[AL % subtbl1len];
		key[i] = AL;
		if (j == seriallen)break;
	}

	for (int i = 0; i < seriallen; i++)
	{
		int offset = findcharintab(subtable1,key[i]);
		unsigned char* ciphertable = buildsertable(offset,subtable1);
		int offset2 = findcharintab(subtable1, name[i]);
		ciphertext[i] = ciphertable[offset2];
		free(ciphertable);
	}
	free(subtable1);
	free(key);
	wsprintf(serial_out, "%s", ciphertext);
	free(ciphertext);
}