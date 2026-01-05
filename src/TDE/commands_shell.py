import time

MOVEMENTS = [
    "I E1 S1/2",
    "I E1 S2/2",
    "I E1 B",
    "I S1/2 B",
    "I S2/2 B",
    "I E2 S1/1",
    "I E2 S2/1",
    "I E2 B",
    "I S1/1 A",
    "I S2/1 A",
    "M E1 S1/2",
    "M E1 S2/2",
    "M S1/2 B", 
    "M S2/2 B",
    "M E2 S1/1",
    "M E2 S2/1",
    "M S1/1 A",
    "M S2/1 A",
    "R E1 S1/2",
    "R E1 S2/2",
    "R E2 S1/1",
    "R E2 S2/1",
    "exit"
]

movement = ""

def test_movement(command):
    return  command in MOVEMENTS

def read_movement():
    global movement
    loop = True
    print("COMMAND INTERFACE")
    while loop:
        command = input(">")
        if test_movement(command):
            movement = command
        else:
            print("movement incorrect")
        if movement == "exit":
            loop = False
        time.sleep(1)

