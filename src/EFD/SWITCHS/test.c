#include "switch.h"
#include <unistd.h>

void print_states();

int main()
{
    int real_positions[] = {0,1};
    int i;

    
    config_switch_gpios();

    print_states();
    set_position(0, REVERSE);
    get_positions();

    print_states();
    
    sleep(1);

    set_position(0,STRAIGHT);
    get_positions();

    print_states();
    terminate_gpio_connection();

    return 0;
}

void print_states()
{
    printf("STATES:\n");
    for(int i = 0; i < NUMBER_SWITCHS; i++)
        printf("\t%d\n",states[i]);
}
