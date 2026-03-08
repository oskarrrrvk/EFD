#include "include/AccessPoint/socket.h"

void app_main(void)
{
    char *message = "hola\n";
    const int message_length = strlen(message);

    const int buffer_length = 100;
    char *buffer = malloc(buffer_length);

    init_sta();
    vTaskDelay(5000 / portTICK_PERIOD_MS); 
    int sockfd = connect_to_server(IP,port);
    if (sockfd < 0) 
    {
        ESP_LOGE("MAIN", "Failed to connect to server");
        return;
    }

    while(1)
    {
        send_data(sockfd, message, message_length);
        vTaskDelay(1000 / portTICK_PERIOD_MS);

        memset(buffer, 0, buffer_length);
        receive_data(sockfd, buffer, buffer_length);
        printf("Received: %s", buffer);
        fflush(stdout);
    }
    return;
}
