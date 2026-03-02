idf_component_register( SRCS "main.c" "include/rail_section/section.c" "include/Communication/socket.c"
                        REQUIRES "driver" "freertos" "log" "esp_wifi" "nvs_flash" "esp_event" "esp_netif"
                        INCLUDE_DIRS "." "include" "include/rail_section" "include/Communication"
                    )
