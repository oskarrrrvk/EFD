#include "section.h"

const int GPIO_RAIL_SECTIONS [RAIL_SECTION_NUMBER] = 
    {
        GPIO_NUM_12, GPIO_NUM_13, GPIO_NUM_14, GPIO_NUM_25, GPIO_NUM_26, GPIO_NUM_27, GPIO_NUM_32, GPIO_NUM_33
    };

int rail_section_states[RAIL_SECTION_NUMBER] = 
    {
        FREE, FREE, FREE, FREE, FREE, FREE, FREE, FREE
    };

void config_rail_sections()
{
    for(int i=0; i < RAIL_SECTION_NUMBER; i++) 
    {
        gpio_reset_pin(GPIO_RAIL_SECTIONS[i]);
        gpio_set_direction(GPIO_RAIL_SECTIONS[i],GPIO_MODE_INPUT);
    }  
}

void read_rail_section_states()
{
    for(int i=0; i < RAIL_SECTION_NUMBER; i++)
    {
        rail_section_states[i] = gpio_get_level(GPIO_RAIL_SECTIONS[i]) == 0 ? OCCUPY : FREE;
        vTaskDelay(pdMS_TO_TICKS(100));
    }

}