#ifndef SWITCH_H
#define SWITCH_H

#include <stdio.h>
#include <pigpio.h>

#define NUMBER_SWITCHS 2

#define STRAIGHT 0
#define REVERSE  1
#define ERROR    2


extern const int SWITCH_OUT[];
extern const int SWITCH_IN[]; 
extern int states[];


int  config_switch_gpios();
void terminate_gpio_connection();
void set_position(int switch_index, int position);
void read_positions(int real_states[]);
void check_real_states(int real_states[]);
void get_positions();

#endif
