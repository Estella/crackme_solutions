#include <windows.h>

void process_serial(char *name, char *serial_out)
{
     BYTE serial_buf [9]={0x23, 0x23, 0x23, 0x23, 0x23, 0x23, 0x23, 0x23,0x0};
     //pad buf with zero in case it fails.
     bool done = false;
        while(!done)
        {
            //the bruteforce
            BYTE *ser_ptr = serial_buf;
            next:
            *ser_ptr = *ser_ptr + 1;
            if (*ser_ptr == '[')
            {
                //limit range to usable ASCII keyspace
                *ser_ptr = 0x23;
                ser_ptr++;
                if (*ser_ptr == 0)
                {
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
                if (regconst == 0xf710c5c4)done = true;
            }
        } 
	wsprintf((char*)serial_out,"%.8s", serial_buf);
}


