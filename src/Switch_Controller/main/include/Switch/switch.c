#include "switch.h"

const int GPIO_SWITCHS [SWITCH_NUMBER] =
    {
        GPIO_NUM_32, GPIO_NUM_33
    };

int switch_states [SWITCH_NUMBER] = 
    {
        STRAIGHT, STRAIGHT
    };

void config_gpio_switch(void)
{
    for(int i=0; i<SWITCH_NUMBER; i++)
    {
        gpio_reset_pin(GPIO_SWITCHS[i]);
        gpio_set_direction(GPIO_SWITCHS[i],GPIO_MODE_OUTPUT);
    }
}

void set_switch_position()
{
    for(int i=0; i<SWITCH_NUMBER; i++)
        gpio_set_level(GPIO_SWITCHS[i],switch_states[i]);
}