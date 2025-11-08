#ifndef SWITCH_H
#define SWITCH_H

#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

#define SWITCH_NUMBER 2

#define STRAIGHT 0
#define INVERSE  1
#define ERROR    2

extern const int GPIO_SWITCHS [SWITCH_NUMBER];
extern int switch_states [SWITCH_NUMBER];

void config_gpio_switch(void);
void set_switch_position(void);

#endif