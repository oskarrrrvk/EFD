idf_component_register(SRCS "main.c" "include/AccessPoint/socket.c"
                       INCLUDE_DIRS "." "include" "include/AccessPoint"
                       REQUIRES driver freertos esp_wifi nvs_flash esp_event esp_netif)
