#include <windows.h>
#include <wincrypt.h>
#include <stdbool.h>

void MD5(BYTE * data, ULONG len, BYTE* hash_data)
{
	HCRYPTPROV hProv = 0;
	HCRYPTPROV hHash = 0;
	CryptAcquireContext(&hProv, NULL, NULL, PROV_RSA_FULL, 0);
	CryptCreateHash(hProv, CALG_MD5, 0, 0, &hHash);
	CryptHashData(hHash, data, len, 0);
	DWORD cbHash = 16;
	CryptGetHashParam(hHash, HP_HASHVAL, hash_data, &cbHash, 0);
	CryptDestroyHash(hHash);
	CryptReleaseContext(hProv, 0);
}

void process_serial(char *name, char *serial_out)
{
	BYTE hash_bytes[16] = { 0 };
	char hash_string[33] = { 0 };
	int namelen = lstrlen(name);
	MD5((BYTE*)name, namelen, (BYTE*)hash_bytes);
	for (int i = 0; i < 4; i++)
	{
		DWORD* bufptr = hash_bytes;
		DWORD bytes = *(DWORD*)(bufptr+i);
		*(DWORD*)(bufptr + i) = _byteswap_ulong(bytes);
	}

	BYTE* bufptr = hash_bytes;
	DWORD EAX_ = *(DWORD*)(bufptr);
	DWORD EBX_ = *(DWORD*)(bufptr+4);
	EAX_ ^= EBX_;
	wsprintf(&hash_string[0], "%.8X", EAX_);
	EBX_ ^= 0xFBD0099;
	wsprintf(&hash_string[8], "%.8X", EBX_);
	DWORD ECX_ = *(DWORD*)(bufptr + 8);
	ECX_ ^= EBX_;
	wsprintf(&hash_string[16], "%.8X", ECX_);
	EBX_ ^= 0xB0C0A09;
	DWORD EDX_ = *(DWORD*)(bufptr + 0x0C);
	wsprintf(&hash_string[24], "%.8X", EDX_);
	wsprintf(serial_out, "%s",hash_string);
}


