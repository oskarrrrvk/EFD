#ifndef SIGNAL_H
#define SIGNAL_H

#include <stdint.h>
#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include <freertos/task.h>
#include "esp_log.h"

#define GPIO_SELECT GPIO_NUM_33
#define CLOCK GPIO_NUM_32

#define RED 0x01
#define GREEN 0x02
#define YELLOW 0x04
#define WHITE 0x08

#define SIGNAL_NUMBER 10

 // cambiar por una sola estructura de señal, los focos que no existan darles un valor ROJO

typedef struct {
    char *NAME;
    int OUTPUT_PIN;
    uint8_t stop;
    uint8_t stop_annucement;
    uint8_t free_way;
    uint8_t manouver;
    uint8_t exceeded_movement;
    uint8_t caution_annucement;
}Signal;

extern Signal signals[SIGNAL_NUMBER];

void config_signals(void);
void set_signal_state(int output_pin[SIGNAL_NUMBER], uint8_t signal[SIGNAL_NUMBER]);
void change_signal_state(void);
#endif