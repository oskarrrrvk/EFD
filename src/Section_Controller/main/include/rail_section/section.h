#ifndef SECTION_H
#define SECTION_H

#include "driver/gpio.h"
#include "esp_log.h"
#include "freertos/FreeRTOS.h"
#include <freertos/task.h>

#define RAIL_SECTION_NUMBER 8
#define OCCUPY 1
#define FREE   0

extern const int GPIO_RAIL_SECTIONS [RAIL_SECTION_NUMBER];
extern int rail_section_states[RAIL_SECTION_NUMBER];

void config_rail_sections(void);
void read_rail_section_states(void);
void send_rail_section_states(void);

#endif