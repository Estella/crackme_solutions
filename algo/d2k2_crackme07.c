#include <windows.h>
#include <stdint.h>

typedef union
{
	uint64_t rx;
	uint32_t ex;
	uint16_t x;
	struct { uint8_t lo, hi; }b;
} Register;

#define BUFFER_SIZE 0x80

unsigned int crc32(const void *data, unsigned int length)
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
	
	char buffer[] = "910E68606534573A1238F9B6D0ED8201";

	DWORD nameptr = *(DWORD*)name;

	Register EBX_, EAX_, ESI_;
	ESI_.ex = 1;
	EAX_.ex = 1;
	EBX_.ex = 1;
	uint32_t crc = crc32(name, EBX_.ex);


	


	wsprintf(serial_out, "%s", buffer);
}


