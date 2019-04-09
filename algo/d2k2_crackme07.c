#include <windows.h>
#include <stdint.h>
#include <stdbool.h>

typedef union
{
	uint64_t rx;
	uint32_t ex;
	uint16_t x;
	struct { uint8_t lo, hi; }b;
} Register;

#define BUFFER_SIZE 0x80

uint32_t crc32(const void *data, unsigned int length)
{
	static const uint32_t crc32tab[16] = {
	0x00000000, 0x1DB71064, 0x3B6E20C8, 0x26D930AC, 0x76DC4190,
	0x6B6B51F4, 0x4DB26158, 0x5005713C, 0xEDB88320, 0xF00F9344,
	0xD6D6A3E8, 0xCB61B38C, 0x9B64C2B0, 0x86D3D2D4, 0xA00AE278,
	0xBDBDF21C
	};
	uint8_t *buf = (uint8_t *)data;
	uint32_t crc = 0xFFFFFFFF;
	uint32_t i;
	if (length == 0) {
		return 0;
	}
	for (i = 0; i < length; ++i) {
		crc ^= buf[i];
		crc = crc32tab[crc & 0x0F] ^ (crc >> 4);
		crc = crc32tab[crc & 0x0F] ^ (crc >> 4);
	}
	return crc ^ 0xFFFFFFFF;
}

void process_serial(char *name, char *serial_out)
{

	/*const char  *alphabet = "0123456789ABCDEF";
	for(int i=0;i<32;i++)
	buffer[i] = alphabet[rand() % 16];
	serial - 910E68606534573A1238F9B6D0ED8201*/
	uint8_t testserial[] = "910E68606534573A1238F9B6D0ED8201";
	uint8_t serialbuffer[16] = { 0 };
	
	uint8_t enc_key[8] = { 0 };
	uint8_t namebuf1[8] = { 0 };

	uint8_t namelen = lstrlen(name);
	
	memcpy(namebuf1, name, namelen);
	uint8_t *nameptr = namebuf1;
	uint8_t* keyptr = enc_key;

	Register ESI_;
	ESI_.ex = 1;
	bool donebrute = false;
	uint32_t crc = 1;

	//*(uint32_t*)nameptr = 0xAC07C0C4;
	//*(uint32_t*)nameptr2 = 0xFEDB7106;
	while (1)
	{
		while (ESI_.ex != 0)
		{
			crc = crc32(namebuf1, 1);
			*(uint32_t*)nameptr += crc;
			ESI_.ex--;
		}
		if (donebrute)break;
		ESI_.ex = crc;
		ESI_.ex &= 0xFFFFFF;
		ESI_.ex -= 0xF0000;
		donebrute = true;
	}
	*(uint32_t*)keyptr = crc;

	DWORD* serialbufptr = serialbuffer;
	BYTE* name_check2 = name;
	uint8_t name_check2dw = namelen;
	for (int i = 0; i < 4; i++)
	{
		uint32_t crc = crc32(name_check2, name_check2dw);
		crc ^= name_check2dw;
		crc = _rotl(crc, 3);
		*(DWORD*)(serialbufptr++) = crc;
		name_check2++;
		name_check2dw--;
	}
	wsprintf(serial_out, "%s", testserial);
}


