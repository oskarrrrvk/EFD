#include "include/Signals/signal.h"
#include "include/Communication/socket.h"

void print_message(char *message[], int num_messages);

int config_client_socket(void);
int config_signal_controller(void);

int split_signal_message(char *message[], int signal_pinout[SIGNAL_NUMBER], uint8_t signal_state[SIGNAL_NUMBER]);
void manage_signals(char *message[]);

void app_main(void)
{
    int sockfd = config_signal_controller();
    if (sockfd < 0) {
        ESP_LOGE("MAIN", "Failed to connect to server");
        return;
    }

    char *message[BUFFER_SIZE];
    while(1)
    {   
        int len = receive_data(sockfd, message);
        if(len < 0) break;

        print_message(message,len);
        
        manage_signals(message);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}

void print_message(char *message[], int num_messages)
{
    for(int i = 0; i < num_messages; i++)
    {
        if(message[i][0] == '\0') break;
        ESP_LOGI("MAIN", "Message: %s", message[i]);
    }
}

int config_client_socket(void)
{
    init_sta();
    vTaskDelay(5000 / portTICK_PERIOD_MS);
    return connect_to_server(IP, PORT);
}

int config_signal_controller(void)
{
    config_signals();
    return config_client_socket();
}

void get_signal_info(char *signal_name, char *color, int *pinout, uint8_t *state)
{
    int i = 0;
    int finded = 0;
    do
    {
        if(strcmp(signal_name, signals[i].NAME) == 0)
        {
            *pinout = signals[i].OUTPUT_PIN;
            if(strcmp(color, "RED") == 0) *state = signals[i].stop;
            else if(strcmp(color, "GREEN") == 0) *state = signals[i].free_way;
            else if(strcmp(color, "GREEN_YELLOW") == 0) *state = signals[i].caution_annucement;
            else if(strcmp(color, "RED_WHITE") == 0) *state = signals[i].manouver;
            else if(strcmp(color, "YELLOW") == 0) *state = signals[i].stop_annucement;
            else if(strcmp(color, "GREEN_WHITE") == 0) *state = signals[i].exceeded_movement;
            else *state = signals[i].stop;
            finded = 1;
        }
        i++;
    } while(i < SIGNAL_NUMBER && !finded);
    if(!finded) {
        *pinout = -1;
        *state = RED;
    }
}

int split_signal_message(char *message[], int signal_pinout[SIGNAL_NUMBER], uint8_t signal_state[SIGNAL_NUMBER])
{
    int num_signals = 0;
    int pinout;
    uint8_t state;
    char *signal_name, *color;

    for(int i = 0; i < SIGNAL_NUMBER; i++)
    {
        if(message[i][0] == '\0') break;

        signal_name = strtok(message[i], ":");
        if(signal_name == NULL) continue;
    
        color = strtok(NULL, ":");
        if(color == NULL) continue;

        get_signal_info(signal_name, color, &pinout, &state);
        if(pinout == -1) continue;

        signal_pinout[num_signals] = pinout;
        signal_state[num_signals] = state;
        num_signals++;
        ESP_LOGI("MAIN", "NAME: %s, COLOR: %s, Pinout: %d, State: 0x%02x", signal_name, color, pinout, state);

    }
    return num_signals == SIGNAL_NUMBER ? 0 : 1;
}

void manage_signals(char *message[])
{
    int signal_pinout[SIGNAL_NUMBER];
    uint8_t signal_state[SIGNAL_NUMBER];

    int equal_signals_states = split_signal_message(message, signal_pinout, signal_state);
    if (equal_signals_states != 0) return;

    set_signal_state(signal_pinout, signal_state);

}