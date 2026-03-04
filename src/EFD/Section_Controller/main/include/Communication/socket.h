#ifndef SOCKET_H
#define SOCKET_H

#include <string.h>
#include <sys/socket.h>

#include "esp_wifi.h"
#include "esp_log.h"
#include "esp_event.h"
#include "nvs_flash.h"
#include "esp_netif.h"

#define SSID "MOVISTAR_F2BF"
#define PASSWORD "9AZj2aA86T42ZQ89bRGe"

#define IP "192.168.1.33"
#define PORT 34543

#define WIFI_CONNECTED_BIT BIT0
#define WIFI_FAIL_BIT      BIT1 

#define BUFFER_SIZE 256

void init_sta(void);
int connect_to_server(char *ip, int port);
void send_data(int sockfd, const char *rail_names[], int states[], int len);
int receive_data(int sockfd, char *message[]);

#endif