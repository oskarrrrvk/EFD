#include "signal.h"

Signal signals[SIGNAL_NUMBER] = {
    {
        .NAME = "E'1",
        .OUTPUT_PIN = GPIO_NUM_21,
        .stop = RED,
        .stop_annucement = YELLOW,
        .free_way = GREEN,
        .caution_annucement = GREEN | YELLOW,
        .manouver = RED,
        .exceeded_movement = RED
    },
    {
        .NAME = "E'2",
        .OUTPUT_PIN = GPIO_NUM_22,
        .stop = RED,
        .stop_annucement = YELLOW,
        .free_way = GREEN,
        .caution_annucement = GREEN | YELLOW,
        .manouver = RED,
        .exceeded_movement = RED
    },
    {
        .NAME = "E1",
        .OUTPUT_PIN = GPIO_NUM_18,
        .stop = RED,
        .stop_annucement = YELLOW,
        .free_way = GREEN,
        .manouver = RED | WHITE,
        .exceeded_movement = GREEN | WHITE,
        .caution_annucement = RED
    },
    {
        .NAME = "E2",
        .OUTPUT_PIN = GPIO_NUM_19,
        .stop = RED,
        .stop_annucement = YELLOW,
        .free_way = GREEN,
        .manouver = RED | WHITE,
        .exceeded_movement = GREEN | WHITE,
        .caution_annucement = RED
    },
    {
        .NAME = "R1",
        .OUTPUT_PIN = GPIO_NUM_23,
        .stop = RED,
        .free_way = 0x06,
        .caution_annucement = 0x0C,
        .manouver = RED | WHITE,
        .exceeded_movement = RED,
        .stop_annucement = RED
    },
    {
        .NAME = "R2",
        .OUTPUT_PIN = GPIO_NUM_25,
        .stop = RED,
        .free_way = 0x06,
        .caution_annucement = 0x0C,
        .manouver = RED | WHITE,
        .exceeded_movement = RED,
        .stop_annucement = RED
    },
    {
        .NAME = "S1/1",
        .OUTPUT_PIN = GPIO_NUM_26,
        .stop = RED,
        .free_way = GREEN,
        .manouver = RED | WHITE,
        .exceeded_movement = RED,
        .caution_annucement = RED,
        .stop_annucement = RED
    },
    {
        .NAME = "S1/2",
        .OUTPUT_PIN = GPIO_NUM_27,
        .stop = RED,
        .free_way = GREEN,
        .manouver = RED | WHITE,
        .exceeded_movement = RED,
        .caution_annucement = RED,
        .stop_annucement = RED
    },
    {
        .NAME = "S2/1",
        .OUTPUT_PIN = GPIO_NUM_32,
        .stop = RED,
        .free_way = GREEN,
        .manouver = RED | WHITE,
        .exceeded_movement = RED,
        .caution_annucement = RED,
        .stop_annucement = RED
    },
    {
        .NAME = "S2/2",
        .OUTPUT_PIN = GPIO_NUM_33,
        .stop = RED,
        .free_way = GREEN,
        .manouver = RED | WHITE,
        .exceeded_movement = RED,
        .caution_annucement = RED,
        .stop_annucement = RED
    }
};

void config_signals(void) {

    for(int i = 0; i < SIGNAL_NUMBER; i++)
    {
        gpio_reset_pin(signals[i].OUTPUT_PIN);
        gpio_set_direction(signals[i].OUTPUT_PIN, GPIO_MODE_OUTPUT);
    }

    gpio_reset_pin(GPIO_SELECT);
    gpio_set_direction(GPIO_SELECT, GPIO_MODE_OUTPUT);
    gpio_reset_pin(CLOCK);
    gpio_set_direction(CLOCK, GPIO_MODE_OUTPUT);
}

void set_signal_state(int output_pin[SIGNAL_NUMBER], uint8_t signal[SIGNAL_NUMBER]) {
    int bit;
    
    gpio_set_level(GPIO_SELECT,1);
    vTaskDelay(1 / portTICK_PERIOD_MS);

    for(int i = 0; i < 5; i++)
    {
        for(int j = 0; j < SIGNAL_NUMBER; j++)
        {
            bit = (signal[j]>>i) & 1;
            gpio_set_level(output_pin[j],bit);
            vTaskDelay(1 / portTICK_PERIOD_MS);
        }
        
        gpio_set_level(CLOCK,1);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
        gpio_set_level(CLOCK,0);
    }
    gpio_set_level(GPIO_SELECT,0);
    vTaskDelay(1000 / portTICK_PERIOD_MS);
}