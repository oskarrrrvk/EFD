#include "signal.h"
#include "driver/gpio.h"

E_x E_1 = {
    .OUTPUT_PIN = GPIO_NUM_21,
    .stop_annucement = YELLOW,
    .free_way = GREEN,
    .caution_annucement = GREEN | YELLOW
};

E_x E_2 = {
    .OUTPUT_PIN = GPIO_NUM_22,
    .stop_annucement = YELLOW,
    .free_way = GREEN,
    .caution_annucement = GREEN | YELLOW
};

Ex E1 = {
    .OUTPUT_PIN = GPIO_NUM_18,
    .stop = RED,
    .stop_annucement = YELLOW,
    .free_way = GREEN,
    .manouver = RED | WHITE,
    .exceeded_movement = GREEN | WHITE
};

Ex E2 = {
    .OUTPUT_PIN = GPIO_NUM_19,
    .stop = RED,
    .stop_annucement = YELLOW,
    .free_way = GREEN,
    .manouver = RED | WHITE,
    .exceeded_movement = GREEN | WHITE
};

Rx R1 = {
    .OUTPUT_PIN = GPIO_NUM_23,
    .stop = RED,
    .horizontal = 0x06,
    .vertical = 0x0C
};

Rx R2 = {
    .OUTPUT_PIN = GPIO_NUM_25,
    .stop = RED,
    .horizontal = 0x06,
    .vertical = 0x0C
};

Sx_x S1_1 = {
    .OUTPUT_PIN = GPIO_NUM_26,
    .stop = RED,
    .free_way = GREEN,
    .manouver = RED | WHITE
};

Sx_x S1_2 = {
    .OUTPUT_PIN = GPIO_NUM_27,
    .stop = RED,
    .free_way = GREEN,
    .manouver = RED | WHITE
};

Sx_x S2_1 = {
    .OUTPUT_PIN = GPIO_NUM_32,
    .stop = RED,
    .free_way = GREEN,
    .manouver = RED | WHITE 
};

Sx_x S2_2 = {
    .OUTPUT_PIN = GPIO_NUM_33,
    .stop = RED,
    .free_way = GREEN,
    .manouver = RED | WHITE
};

void config_signals(void) {
    gpio_reset_pin(E1.OUTPUT_PIN);
    gpio_set_direction(E_1.OUTPUT_PIN, GPIO_MODE_OUTPUT);

    gpio_reset_pin(E_2.OUTPUT_PIN);
    gpio_set_direction(E_2.OUTPUT_PIN, GPIO_MODE_OUTPUT);

    gpio_reset_pin(E1.OUTPUT_PIN);
    gpio_set_direction(E1.OUTPUT_PIN, GPIO_MODE_OUTPUT);

    gpio_reset_pin(E2.OUTPUT_PIN);
    gpio_set_direction(E2.OUTPUT_PIN, GPIO_MODE_OUTPUT);

    gpio_reset_pin(R1.OUTPUT_PIN);
    gpio_set_direction(R1.OUTPUT_PIN, GPIO_MODE_OUTPUT);

    gpio_reset_pin(R2.OUTPUT_PIN);
    gpio_set_direction(R2.OUTPUT_PIN, GPIO_MODE_OUTPUT);

    gpio_reset_pin(S1_1.OUTPUT_PIN);
    gpio_set_direction(S1_1.OUTPUT_PIN, GPIO_MODE_OUTPUT);

    gpio_reset_pin(S1_2.OUTPUT_PIN);
    gpio_set_direction(S1_2.OUTPUT_PIN, GPIO_MODE_OUTPUT);

    gpio_reset_pin(S2_1.OUTPUT_PIN);
    gpio_set_direction(S2_1.OUTPUT_PIN, GPIO_MODE_OUTPUT);

    gpio_reset_pin(S2_2.OUTPUT_PIN);
    gpio_set_direction(S2_2.OUTPUT_PIN, GPIO_MODE_OUTPUT);
}

void set_signal_state(char signal) {

}