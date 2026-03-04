#include "rail_section/section.h"
#include "Communication/socket.h"

int config_rail_controller(void);

void app_main(void)
{
    int states[RAIL_SECTION_NUMBER] = {1, 0, 1, 0, 1, 0, 1, 0};
    config_rail_sections();
    int sockfd = config_rail_controller();
    if(sockfd < 0) {
        ESP_LOGE("MAIN", "Failed to configure rail controller");
        return;
    }
    while(1)
    {
        read_rail_section_states();
        send_data(sockfd, NAME_RAIL_SECTIONS, states, RAIL_SECTION_NUMBER);
        //send_data(sockfd, rail_section_states, RAIL_SECTION_NUMBER);
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

int config_rail_controller(void)
{
    config_rail_sections();
    init_sta();
    vTaskDelay(pdMS_TO_TICKS(5000));
    return connect_to_server(IP, PORT);
}