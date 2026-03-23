#include "server.h"

void config_server()
{

    server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket < 0) 
    {
        perror("Socket creation failed");
        exit(1);
    }

    printf("Server <IP> : <PORT> %s : %d\n", SERVER_IP, SERVER_PORT);
    memset(&server_addr, 0, sizeof(server_addr));

    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(SERVER_PORT);
    server_addr.sin_addr.s_addr = inet_addr(SERVER_IP);

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


void accept_connection(void)
{
    socklen_t addr_len = sizeof(client_addr);
    listener_socket = accept(server_socket, (struct sockaddr *)&client_addr, &addr_len);
    if ( listener_socket < 0)
    {
        perror("Accept failed");
        close(server_socket);
        exit(1);
    }

}

void receive_message(char *message)
{
    char *buffer = (char*) malloc(MAXLINE);
    if (buffer == NULL) {
        perror("Failed to allocate message buffer");
        exit(1);
    }
    
    memset(buffer, 0, MAXLINE);

    int flag = fcntl(listener_socket, F_GETFL, 0);
    fcntl(listener_socket, F_SETFL, flags | O_NONBLOCK);

    int bytes = recv(listener_socket, buffer, MAXLINE, 0);   
    if(bytes >= 0)
    {
        buffer[bytes] = '\0';
        strcpy(message,buffer);
        free(buffer);
    }
        
}

void send_message(char *message)
{
    send(listener_socket, message, strlen(message), 0);
}


void close_connection(void)
{
    if (listener_socket > 0)
        close(listener_socket);
}