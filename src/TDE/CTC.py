import socket
from threading import Thread
import commands_shell as shell

ip=""
port=0
s=None

def read_config_file():
    with open('socket_server.conf','r') as config_file:
        lines = config_file.readlines()
        global ip
        global port
    ip,port = lines[0].split(':')

def config_client_socket():
    global s
    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    print("Connecting to server")
    while s.connect_ex((ip,int(port))) != 0:
        pass
    print("\nConnected to server")

def client_socket():
    loop = True
    while loop:
        if shell.movement == "exit":
            loop = False
        else:
            if shell.movement != "":
                s.sendall(shell.movement.encode('utf-8'))
                shell.movement = ""
    s.close()


if __name__ == "__main__":
    read_config_file()
    config_client_socket()
    server_thread = Thread(name="Server",target=client_socket)
    commands_thread = Thread(name="Commands",target=shell.read_movement)

    server_thread.start()
    commands_thread.start()
    
    commands_thread.join()
    server_thread.join()