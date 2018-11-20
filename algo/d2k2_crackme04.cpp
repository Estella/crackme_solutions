#include <windows.h>
#include <stdio.h>
void process_serial(char *name, char *serial_out)
{
    BYTE serial_buf[9] = { '0', '0','0', '0', '0', '0', '0', '0',0x0 };
    const int check_dword = 0xFFFFE3B0 ^ 0x8EF21BD;
    //pad buf with zero in case it fails.
    bool done = false;
    int num_ser = 0;
    FILE  * pFile = fopen("keys.txt", "w");
    BYTE *ser_ptr = serial_buf;
    while (!done)
    {
        //the bruteforce
        (*ser_ptr)++;
        if (*ser_ptr == 'Z')
        {
            //limit range to usable ASCII keyspace
            *ser_ptr++ = '0';
            if (*ser_ptr == 0)
            {
                fclose(pFile);
                wsprintf((char*)serial_out, "Nothing found.");
                return;
            }
            else continue;
        }
        else
        {
            ser_ptr = serial_buf;
            int regconst = 0;
            //const calc
            for (int i = 7; i >= 0; --i)
            {
                regconst += serial_buf[i];
                regconst *= regconst;
            }
            //right regconst?
            if (regconst == check_dword)
            {
                fprintf(pFile, "%s\n", serial_buf);
                num_ser++;
            }
            if (num_ser == 6)done = true;
        }
    }
    fclose(pFile);
    wsprintf((char*)serial_out, "Serials listed in \"keys.txt\"!");
}


