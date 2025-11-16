import os
import time

MOVEMENTS = [
    "I E1 S2/1",
    "I E1 S2/2",
    "I S2/2 B",
    "I S2/1 B",
    "I E1 B",
    "I E2 S1/1",
    "I E2 S1/2",   
    "I S1/1 A",
    "I S1/2 A",
    "I E2 A",
    "M E1 S2/1",
    "M E1 S2/2",
    "M S2/1 B", 
    "M S2/2 B",
    "M E2 S1/1",
    "M E2 S1/2",
    "M S1/1 A",
    "M S1/2 A",
    "R E1 S2/2",
    "R E1 S2/1",
    "R E2 S1/1",
    "R E2 S1/2",
    "exit"
]

movement = ""

def test_movement(command):
    return  command in MOVEMENTS

def read_movement():
    global movement
    loop = True
    while loop:
        print("COMMAND INTERFACE")
        command = input(">")
        if test_movement(command):
            movement = command
            print("movement success")
        else:
            print("movement incorrect")

        if command == "exit":
            loop = False
        
        time.sleep(1)
        os.system('cls' if os.name == 'nt' else 'clear')

