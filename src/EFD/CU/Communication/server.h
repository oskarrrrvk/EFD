#ifndef SERVER_CTC_H
#define SERVER_CTC_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#include <arpa/inet.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h> 

#define MAXLINE 1024

extern struct sockaddr_in server_addr;
extern struct sockaddr_in client_addr;

int config_server(void);
int accept_connection(int server_socket);
void receive_message(char *message, int listener_socket);
void send_message(char *message, int listener_socket);
void close_connection(int listener_socket);

#endif
