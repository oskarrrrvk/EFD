#ifndef INTRANET_H
#define INTRANET_H

#include <string.h>

#include "freertos/FreeRTOS.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "esp_netif.h"
#include "esp_mac.h"

#define WIFI_CONNECTED_BIT BIT0
#define WIFI_FAIL_BIT      BIT1 


#define SSID "EFD"
#define PASSWORD "STROsEFD"
#define CHANNEL 1
#define EXAMPLE_MAX_STA_CONN 4

void init_access_point(void);

#endif 