#ifndef SERVER_CTC_H
#define SERVER_CTC_H

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<netdb.h> 

#define MAXLINE 1024

#define SERVER_IP ""
#define SERVER_PORT 50345
extern int server_socket, listener_socket;

extern struct sockaddr_in server_addr;
extern struct sockaddr_in client_addr;

void config_server(void);
void accept_connection(void);
void receive_message(void);
void send_message(void);
void close_connection(void);

#endif
