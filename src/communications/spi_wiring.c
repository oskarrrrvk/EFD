#include <stdio.h>
#include <stdint.h>
#include <unistd.h>

#include <wiringPi.h>
#include <wiringPiSPI.h>

#define CHANNEL 0
#define SPEED 500000
#define BUFFER_SIZE 4 


int main(void)
{
    int fd;
    uint8_t rx_buffer[BUFFER_SIZE];

    wiringPiSetup();

    fd = wiringPiSPISetup(CHANNEL,SPEED);
    
    if(fd < 0)
	return 0;

    while(1)
    {
        wiringPiSPIDataRW(CHANNEL, rx_buffer, BUFFER_SIZE);

	printf("ENTRADA: 0x");
	for(int i = 0; i < BUFFER_SIZE; i++)
	    printf("%02X",rx_buffer[i]);
	printf("\n");
	sleep(1);
    }
    return 0;
}
