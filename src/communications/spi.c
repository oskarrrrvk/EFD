#include <stdint.h>
#include <time.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/spi/spidev.h>

#define SPI_0 "/dev/spidev0.0"

int main()
{
    int fd;
    uint8_t mode = SPI_MODE_0;
    uint8_t bits = 8;
    uint32_t speed = 500000;    
    int len = 4;
    
    uint8_t *rx = malloc(len);

    struct spi_ioc_transfer tr = {
	.tx_buf = (unsigned long)NULL,
	.rx_buf = (unsigned long)rx,
	.delay_usecs = 0,
	.len = (unsigned int)len,
	.speed_hz = speed,
	.bits_per_word = bits,
    
    };


    fd = open(SPI_0, O_RDWR);
    if(fd < 0 || !rx) 
    {
	free(rx);
	close(fd);
        perror("Error al abrir el SPI");
	return 1;
    }

    
    ioctl(fd, SPI_IOC_RD_MODE, &mode);
    
    ioctl(fd, SPI_IOC_RD_BITS_PER_WORD, &bits);
    
    ioctl(fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed);
    while(1)
    {
	ioctl(fd, SPI_IOC_MESSAGE(1),&tr);
        
        printf("Entrada: 0x");
        for(int i = 0; i < len; i++)
        {
            printf("%02x",rx[i]);
        }
        printf("\n");
	fflush(stdout);
	sleep(1);
    }
    free(rx);
    close(fd);
    return 0;
}
