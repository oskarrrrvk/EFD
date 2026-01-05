import tkinter as tk

import Components.Rail as rail
from Components.Switchs import SwitchLeft, SwitchRight
from Components.Signals import Circle_Signal, Square_Signal

state = ""

cvs = [
    rail.HorizontalRail("CVE_1",10,400,150),      
    rail.HorizontalRail("CVE1",180,400,150),
    rail.HorizontalRail("CV1",600,400,250),
    rail.HorizontalRail("CV2",600,250,250),
    rail.HorizontalRail("CVE2",1130,400,150),
    rail.HorizontalRail("CVE_2",1310,400,150)
]

swts = [
    SwitchRight("1",350,400),
    SwitchLeft("2",1050,400)
    ]

sgnls = [
    Circle_Signal("E'1",10,370,1),
    Circle_Signal("E1",155,370,1),
    Square_Signal("R1",350,370,1),
    Circle_Signal("S2/1",880,370,1),
    Circle_Signal("S2/2",880,220,1),
    Circle_Signal("E'2",1460,370,-1),
    Circle_Signal("E2",1280,370,-1),
    Square_Signal("R2",1100,370,-1),
    Circle_Signal("S1/1",570,370,-1),
    Circle_Signal("S2/1",570,220,-1)
    ]

root = tk.Tk()

width = root.winfo_screenwidth()
height = root.winfo_screenheight()

root.title("Estación de Prueba")

def initialize_section_rails(canvas:tk.Canvas):
    for cv in cvs:
        coords = cv.get_coords()
        cv.set_id(canvas.create_polygon( coords,fill=cv.get_color()))

def initialize_switchs(canvas:tk.Canvas):
    for sw in swts:
        coords = sw.get_coordinates()
        colors = sw.get_color()
        for i,coord in enumerate(coords):
            sw.set_id(canvas.create_polygon(coord, fill=colors[i]))

def initialize_signals(canvas:tk.Canvas):
    for s in sgnls:
        torch = s.get_torch_signal_coordinates()
        foot = s.get_foot_signal_coordinates()

        idf = canvas.create_polygon(foot,fill=s.get_foot_signal_color())
        if isinstance(s, Circle_Signal):
            idt = canvas.create_oval(torch,fill=s.get_torch_signal_color())
        else:
            idt = canvas.create_polygon(torch,fill=s.get_torch_signal_color())
    s.set_id(idt,idf)

def initialize_draw(canvas:tk.Canvas):
    initialize_section_rails(canvas)
    initialize_switchs(canvas)
    initialize_signals(canvas)

def update_states():
    pass

def update_draw(canvas:tk.Canvas):    
    
    update_states()
    
    for polygon in cvs + swts:
        canvas.itemconfig(polygon.get_id(),fill=polygon.get_color())
    for signal in sgnls:
        idt, idf = signal.get_id()
        canvas.itemconfig(idf,fill=signal.get_foot_signal_color())
        canvas.itemconfig(idt,fill=signal.get_torch_signal_color())

    root.after(500,update_draw)

def display_station():

    canvas = tk.Canvas(root, width=width, height=height, bg="black")
    canvas.pack()

    initialize_draw(canvas)
    #update_draw(canvas)

    root.mainloop()