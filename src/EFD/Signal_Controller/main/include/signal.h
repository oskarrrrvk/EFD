#ifndef SIGNAL_H
#define SIGNAL_H

#include <stdint.h>

#define RED 0x01
#define GREEN 0x02
#define YELLOW 0x04
#define WHITE 0x08

typedef struct {
    int OUTPUT_PIN;
    uint8_t stop_annucement;
    uint8_t free_way;
    uint8_t caution_annucement;
}E_x;

typedef struct {
    int OUTPUT_PIN;
    uint8_t stop;
    uint8_t stop_annucement;
    uint8_t free_way;
    uint8_t manouver;
    uint8_t exceeded_movement;
} Ex;

typedef struct {
    int OUTPUT_PIN;
    uint8_t stop;
    uint8_t horizontal;
    uint8_t vertical;
} Rx;

typedef struct {
    int OUTPUT_PIN;
    uint8_t stop;
    uint8_t free_way;
    uint8_t manouver;
}Sx_x;

extern E_x E_1, E_2;
extern Ex E1, E2;
extern Rx R1, R2;
extern Sx_x S1_1, S1_2, S2_1, S2_2;

void config_signals(void);
void set_signal_state(char);

#endif