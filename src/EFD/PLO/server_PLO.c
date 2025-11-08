#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<netdb.h> 

#define MAXLINE 1024

char server_ip[16];
int server_port, server_socket;

struct sockaddr_in server_addr;

void read_config_file(const char* filename, char* server_info);
void split_server_info(char* server_info);

void config_server(void);

void receive_message(void);

int main (int argc, char **argv){
    if (argc < 2){
        printf("./server_PLO <file_name.conf>\n");
        return 1;
    }
    char server_info[100];
    printf("Configuration file: %s\n", argv[1]);
    read_config_file(argv[1], server_info);
    if(strlen(server_info) < 2){
        printf("Config file is empty\n");
        return 1;
    }
    split_server_info(server_info);
    server_socket = socket(AF_INET, SOCK_DGRAM, 0);
    if (server_socket < 0) {
        perror("Socket creation failed");
        return 1;
    }
    config_server();

    receive_message();

    close(server_socket);
    return 0;

}

void read_config_file(const char* filename, char* server_info) 
{
    FILE* df = fopen(filename, "r");
    if (df == NULL) {
        printf("Could not open config file %s\n", filename);
        exit(1);
    }
    fscanf(df, "%s", server_info);
    fclose(df);
}

void split_server_info(char* server_info)
{
    char *token = strtok(server_info,":");
    strcpy(server_ip, token);
    token = strtok(NULL, ":");
    server_port = atoi(token);
}

void config_server()
{
    printf("Server <IP> : <PORT> %s : %d\n", server_ip, server_port);
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(server_port);
    server_addr.sin_addr.s_addr = inet_addr(server_ip);
    if (bind(server_socket, (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
        perror("Bind failed");
        exit(1);
    }

}

void receive_message()
{
    char *buffer = (char*) malloc(MAXLINE);
    if (buffer == NULL) {
        perror("Failed to allocate message buffer");
        exit(1);
    }

    struct sockaddr_in client_addr;
    socklen_t client_len = sizeof(client_addr);
    int msg_readed;
   
    printf("Server waiting for messages...\n");
    do {
        memset(buffer, 0, MAXLINE);
        msg_readed = recvfrom(server_socket, buffer, MAXLINE-1, 0,
                             (struct sockaddr*)&client_addr, &client_len);
        
        if (msg_readed < 0) {
            perror("Error receiving message");
            break;
        }
        
        printf("Message: %s\n", buffer);       
    } while (strstr(buffer,"exit") == 0 && msg_readed > 0);
    
    free(buffer);
}