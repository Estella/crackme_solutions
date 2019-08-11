#include <windows.h>
#include <wincrypt.h>
#include <stdbool.h>

void MD5(BYTE * data, ULONG len, BYTE* rgbhash)
{
	HCRYPTPROV hProv = 0;
	HCRYPTPROV hHash = 0;
	CryptAcquireContext(&hProv, NULL, NULL, PROV_RSA_FULL, 0);
	CryptCreateHash(hProv, CALG_MD5, 0, 0, &hHash);
	CryptHashData(hHash, data, len, 0);
	DWORD cbHash = 16;
	CryptGetHashParam(hHash, HP_HASHVAL, rgbhash, &cbHash, 0);
	CryptDestroyHash(hHash);
	CryptReleaseContext(hProv, 0);
}

void process_serial(char *name, char *serial_out)
{
	BYTE hash_bytes[16] = { 0 };
	char hash_string[33] = { 0 };

	MD5((BYTE*)name, lstrlen(name), (BYTE*)hash_bytes);
	for (int i = 0; i < 16; ++i)
		wsprintf(&hash_string[i * 2], "%02x", (unsigned int)hash_bytes[i]);

	wsprintf(serial_out, "%s",hash_string);
}


