import socket
import time
from threading import Thread
import commands_shell as shell
import synoptic

ip=""
port=0
command=None

def read_config_file():
    global ip
    global port
    with open('socket_server.conf','r') as config_file:
        line = config_file.readline()
        ip,port = line.split(':')

def config_command_shell_socket():
    global command
    command = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    print("Connecting to server")
    while command.connect_ex((ip,int(port))) != 0:
        pass
    print("\nConnected to server")

def command_sender_socket():
    loop = True
    while loop:
        if shell.movement != "":
            if shell.movement == "exit":
                loop = False
            command.sendall(shell.movement.encode('utf-8'))
            time.sleep(0.5)
            synoptic.state = command.recv(1024).decode('utf-8')
            print(f"Messeage: {synoptic.state}")
            shell.movement = ""
        time.sleep(0.1)
    command.close()

if __name__ == "__main__":
    read_config_file()
    config_command_shell_socket()
    command_client_thread = Thread(name="Server",target=command_sender_socket)
    commands_thread = Thread(name="Commands",target=shell.read_movement)


    command_client_thread.start()
    commands_thread.start()
    
    synoptic.display_station()

    commands_thread.join()
    command_client_thread.join()