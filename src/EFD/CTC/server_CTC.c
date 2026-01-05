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
int server_port, server_socket, listener_socket;

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
    printf("Configuration file: %s\n", argv[1]);

    char server_info[100];
    read_config_file(argv[1], server_info);
    if(strlen(server_info) < 2){
        printf("Config file is empty\n");
        return 1;
    }

    split_server_info(server_info);
    
    server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket < 0) {
        perror("Socket creation failed");
        return 1;
    }
    config_server();

    receive_message();

    close(listener_socket);
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

    if(listen(server_socket,3) < 0)
    {
        perror("Error on listener socket");
        close(server_socket);
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
    socklen_t addr_len = sizeof(client_addr);
    int msg_readed;
    
    char* message ="a";

    listener_socket = accept(server_socket, (struct sockaddr *)&client_addr, &addr_len);
    if ( listener_socket < 0)
    {
        printf("listener: %d",listener_socket);
        perror("Accept failed");
        close(server_socket);
        exit(1);
    }
    
    printf("Server waiting for messages...\n");
    do 
    {
        memset(buffer, 0, MAXLINE);
        msg_readed = recv(listener_socket, buffer, MAXLINE, 0);   
        printf("Message: %s\n", buffer);
        send(listener_socket, message, strlen(message), 0);
    } while (strstr(buffer,"exit") == 0 && msg_readed > 0);
    
    free(buffer);
}