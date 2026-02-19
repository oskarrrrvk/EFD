#include "switch.h"

const int SWITCH_IN[] = {6,26};
const int SWItCH_OUT[] = {5,13};
int states[] = {0,0};

int config_switch_gpios()
{
    if(gpioInitialise() < 0)
    	return 1;
    for(int i = 0; i < NUMBER_SWITCHS; i++)
    {
        gpioSetMode(SWITCH_IN[i], PI_INPUT);
	gpioSetMode(SWITCH_OUT[i], PI_OUTPUT);
    }
    return 0; 
}

void terminate_gpio_connection()
{
    gpioTerminate();
}

void set_position(int switch_index, int position)
{
    if(0 < switch_index && switch_index > 1 && position != STRAIGHT && position != REVERSE)
    {
        printf("ERROR: invalid parameters");
	return;
    }
    gpioWrite(SWITCH_OUT[switch_index],position);
}

void read_position(int real_states[])
{
    for(int i = 0; i < NUMBER_SWITCHS; i++)
    	real_states[i] = gpioRead(SWITCH_IN[i]);
}

void check_real_states(int real_states[])
{
    for(int i = 0; i < NUMBER_SWITCHS;i++)
        states[i] = real_states[i] == states[i] ? states[i] : ERROR; 
}

void get_position()
{
    int desire_positions [NUMBER_SWITCHS];
    
    read_position(desire_positions);
    check_real_positions(desire_positions);
}
