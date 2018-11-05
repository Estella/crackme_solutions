#include <windows.h>
#include <stdio.h>
void process_serial(char *name, char *serial_out)
{
    BYTE serial_buf[9] = { 0x23, 0x23, 0x23, 0x23, 0x23, 0x23, 0x23, 0x23,0x0 };
    //pad buf with zero in case it fails.
    bool done = false;
    int num_ser = 0;
    FILE  * pFile = fopen("keys.txt", "w");
    while (!done)
    {
        //the bruteforce
        BYTE *ser_ptr = serial_buf;
    next:
        (*ser_ptr)++;
        if (*ser_ptr == '[')
        {
            //limit range to usable ASCII keyspace
            *ser_ptr = '#';
            ser_ptr++;
            if (*ser_ptr == 0)
            {
                fclose(pFile);
                wsprintf((char*)serial_out, "Nothing found.");
                return;
            }
            else goto next;
        }
        else
        {
            int regconst = 0;
            //const calc
            for (int i = 7; i >= 0; --i)
            {
                regconst += serial_buf[i];
                regconst *= regconst;
            }
            //right regconst?
            if (regconst == 0xf710c5c4)
            {
                fprintf(pFile, "%s\n", serial_buf);
                num_ser++;
            }
            if (num_ser == 6)done = true;

        }
    }
    fclose(pFile);
    wsprintf((char*)serial_out, "Serials listed in 'keys.txt'!");
}


