#include "socket.h"

static EventGroupHandle_t s_wifi_event_group;

static void wifi_event_handler(void *arg, esp_event_base_t event_base,
                               int32_t event_id, void *event_data)
{

    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        esp_wifi_connect();
        ESP_LOGI("STA", "Station started");
    } else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t *event = (ip_event_got_ip_t *) event_data;
        ESP_LOGI("STA", "Got IP:" IPSTR, IP2STR(&event->ip_info.ip));
        
        // Add safety check
        if (s_wifi_event_group != NULL) {
            xEventGroupSetBits(s_wifi_event_group, WIFI_CONNECTED_BIT);
        } else {
            ESP_LOGE("STA", "Event group not initialized!");
        }
    }
}

void init_sta(void) {
    esp_err_t ret = nvs_flash_init();
    
    s_wifi_event_group = xEventGroupCreate();

    ESP_ERROR_CHECK(esp_netif_init());
    ESP_ERROR_CHECK(esp_event_loop_create_default());
    esp_netif_create_default_wifi_sta();

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));

    ESP_ERROR_CHECK(esp_event_handler_instance_register(WIFI_EVENT,
                                                        ESP_EVENT_ANY_ID,
                                                        &wifi_event_handler,
                                                        NULL,
                                                        NULL));
    ESP_ERROR_CHECK(esp_event_handler_instance_register(IP_EVENT,
                                                        IP_EVENT_STA_GOT_IP,
                                                        &wifi_event_handler,
                                                        NULL,
                                                        NULL));

    wifi_config_t wifi_config = {
        .sta = {
            .ssid = SSID,
            .password = PASSWORD
        },
    };
    if (strlen(PASSWORD) == 0) {
        wifi_config.sta.threshold.authmode = WIFI_AUTH_OPEN;
    }

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &wifi_config));
    ESP_ERROR_CHECK(esp_wifi_start());

    ESP_LOGI("STA", "wifi_init_sta finished.");
}

int connect_to_server(char *ip, int port) {
    struct sockaddr_in client_addr;

    int sockfd = socket(AF_INET, SOCK_STREAM, 0);

    client_addr.sin_family = AF_INET;
    client_addr.sin_port = htons(port);
    inet_pton(AF_INET, ip, &client_addr.sin_addr);
    
    if(connect(sockfd, (struct sockaddr *)&client_addr, sizeof(client_addr)) < 0)
    {
        ESP_LOGE("SOCKET", "Connection to server failed");
        return -1;
    }

    return sockfd;
}

void send_data(int sockfd, int states[], int len) {
    char *message=malloc(BUFFER_SIZE);
    int offset = 0;
    for(int i=0; i < len-1; i++) {
        offset += snprintf(message+offset, BUFFER_SIZE-offset, "%d;", states[i]);
    }
    snprintf(message+offset, BUFFER_SIZE-offset, "%d;", states[len-1]);
    send(sockfd, message, strlen(message), 0);
    free(message);
}

int receive_data(int sockfd, char *message[]) {
    char *buffer = malloc(BUFFER_SIZE);
    memset(buffer, 0, BUFFER_SIZE);
    int len = recv(sockfd, buffer, BUFFER_SIZE, 0);
    if(len < 0)
    {
        free(buffer);
        return -1;
    }

    int count = 0;

    char* token = strtok(buffer, ";");

    while(token != NULL && len < BUFFER_SIZE){
          
        message[count] = malloc(strlen(token) + 1);
        if(message[count] == NULL) break;
        strcpy(message[count], token);
        count++;
        token = strtok(NULL, ";");
    }
    free(buffer);
    return count;
}