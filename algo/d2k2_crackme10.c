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
	BYTE md5_hash[16] = { 0 };
	int namelen = lstrlen(name);
	MD5((BYTE*)name, namelen, (BYTE*)md5_hash);
	wsprintf(serial_out, "test");
}


