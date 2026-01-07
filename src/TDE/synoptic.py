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
        ids = []
        coords = sw.get_coordinates()
        colors = sw.get_color()
        for i,coord in enumerate(coords):
            ids.append(canvas.create_polygon(coord, fill=colors[i]))
        sw.set_id(ids)

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

def update_cv_state(cv_state:list[str]):
    for st in cv_state:
        name,color = st.split(':')
        for cv in cvs:
            if cv.get_name() == name:
                cv.change_color(color)

def update_sw_state(sw_state:list[str]):
    for st in sw_state:
        name,element = st.split(':')
        position,color = element.replace('[','').replace(']','').split(',')
        for sw in swts:
            if sw.get_name() == name:
                if position[0] == 'N':
                    sw.set_normal_direction(color)
                elif position[0] == 'R':
                    sw.set_reverse_direction(color)

def update_sgnl_state(sgnl_state:list[str]):
    for st in sgnl_state:
        name,colors = st.split(':')
        torch_color, foot_color = colors.replace('[','').replace(']','').split(',')
        for sgnl in sgnls:
            if sgnl.get_name() == name:
                sgnl.change_color(torch_color,foot_color)

def update_states():
    states = state.split(';')
    update_cv_state([st for st in states if st.startswith('CV')])
    update_sw_state([st for st in states if not st.startswith(('CV','E','S','R'))])
    update_sgnl_state([st for st in states if st.startswith(('E','S','R'))])

def update_section_rail_draw(canvas:tk.Canvas):    
    for cv in cvs:
        canvas.itemconfig(cv.get_id(),fill=cv.get_color())

def update_switch_draw(canvas:tk.Canvas):
    for sw in swts:
        ids = sw.get_id()
        colors = sw.get_color()
        for i,id in enumerate(ids):
            canvas.itemconfig(id,fill=colors[i])
        
def update_signal_draw(canvas:tk.Canvas):        
    for signal in sgnls:
        idt, idf = signal.get_id()
        canvas.itemconfig(idf,fill=signal.get_foot_signal_color())
        canvas.itemconfig(idt,fill=signal.get_torch_signal_color())

def update_draw(canvas:tk.Canvas):    
    global state
    if state != "":
        update_states()
        update_section_rail_draw(canvas)
        update_switch_draw(canvas)
        update_signal_draw(canvas)
        state = ""
    root.after(1000,update_draw, canvas)
    
def display_station():

    canvas = tk.Canvas(root, width=width, height=height, bg="black")
    canvas.pack()

    initialize_draw(canvas)
    update_draw(canvas)
    
    root.mainloop()