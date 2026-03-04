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

extern char server_ip[16];
extern int server_port, server_socket, listener_socket;

extern struct sockaddr_in server_addr;

void execute_CTC(char *config_filename);

void read_config_file(const char* filename, char* server_info);
void split_server_info(char* server_info);

void config_server(void);

void receive_message(void);

#endif
