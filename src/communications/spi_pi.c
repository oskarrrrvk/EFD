#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>

#include <pigpio.h>

int main()
{
    unsigned channel = 0;
    unsigned baud    = 400000;
    unsigned mode    = 0x002804; //10244, 0x002804
    unsigned len     = 4;


    int rc;
    
    gpioInitialise();

    int handle = spiOpen(channel, baud, mode);
    if(handle < 0)
    {
        gpioTerminate();
	return 1;
    }

    char rx[len];
    char tx[] = {0xA5, 0x34, 0x22, 0xCC};
    
    printf("hadle: %d\n",handle);
    while(1)
   {
	//spiRead(handle,rx,len);
	spiXfer(handle,tx,rx,len);
	   
	printf("0x");
        for(int i = 0; i < len;i++)
	    printf("%02X",rx[i]);
	printf("\n");
	fflush(stdout);
        sleep(1);
    }
    spiClose(handle);
    gpioTerminate();
    return 0;
}


