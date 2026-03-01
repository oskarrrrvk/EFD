idf_component_register(SRCS "main.c" "include/Signals/signal.c" "include/Communication/socket.c"
                       REQUIRES "driver" "freertos" "log" "esp_wifi" "nvs_flash" "esp_event" "esp_netif"
                       INCLUDE_DIRS "." "include/Signals" "include/Communication")
