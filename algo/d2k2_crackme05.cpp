#include <windows.h>

void process_serial(char *name, char *serial_out)
{
	unsigned char buffer_4034AB[32] = { 0 };
	memcpy(buffer_4034AB, name, strlen(name));
	unsigned char buffer_004050F0[32] = { 0 };
	int eax = strlen(name);
	buffer_004050F0[0] = eax;
	int ecx = 0;
	int ebx = 0;
	int edx = 0;

	while (ecx < eax)
	{
	ebx = buffer_4034AB[ecx];
	ebx += eax;
	edx = *(DWORD *)buffer_4034AB;
	edx = edx ^ ebx;
	buffer_4034AB[ecx] = (BYTE)edx;
	ecx++;
	}

	ecx = 0;
	eax = buffer_004050F0[0];
	edx = 0x68F6B76C;
	ebx = 0x10101010;
hashloop:
	ebx |= (buffer_4034AB[ecx] << 0);
	ebx <<= 5;
	edx *= eax;
	ebx *= eax;
	edx ^= ebx;
	edx += *(DWORD *)buffer_4034AB;
	*(DWORD *)buffer_4034AB = edx;


	//call hash function


	wsprintf(serial_out, "%s", name);
}