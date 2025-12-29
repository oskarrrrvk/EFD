import tkinter as tk

import Components.Rail as rail
from Components.Switchs import SwitchLeft, SwitchRight
from Components.Signals import Circle_Signal, Square_Signal

root = tk.Tk()

width = root.winfo_screenwidth()
height = root.winfo_screenheight()

root.title("Estación de Prueba")

cvs = [
        rail.HorizontalRail("CVE_1",10,400,150),      
        rail.HorizontalRail("CVE1",180,400,150),
        rail.HorizontalRail("CV2",600,250,250),
        rail.HorizontalRail("CV1",600,400,250),
        rail.HorizontalRail("CVE2",1130,400,150),
        rail.HorizontalRail("CVE_2",1310,400,150)
]

ags = [SwitchRight("1",350,400),SwitchLeft("2",1050,400)]

sgnl = [Circle_Signal("E'1",10,370,1),
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

def draw_section_rails(canvas:tk.Canvas):
    for cv in cvs:
        coords = cv.get_coords()
        canvas.create_polygon( coords,fill=cv.get_color())

def draw_switchs(canvas:tk.Canvas):
    for ag in ags:
        coords = ag.get_coordinates()
        colors = ag.get_color()
        for i,coord in enumerate(coords):
            canvas.create_polygon(coord, fill=colors[i])

def draw_signals(canvas:tk.Canvas):
    for s in sgnl:
        torch = s.get_torch_signal_coordinates()
        foot = s.get_foot_signal_coordinates()

        canvas.create_polygon(foot,fill=s.get_foot_signal_color())
        if isinstance(s, Circle_Signal):
            canvas.create_oval(torch,fill=s.get_torch_signal_color())
        else:
            canvas.create_polygon(torch,fill=s.get_torch_signal_color())



def draw_station():

    canvas = tk.Canvas(root, width=width, height=height, bg="black")
    canvas.pack()

    draw_section_rails(canvas)
    draw_switchs(canvas)
    draw_signals(canvas)

    root.mainloop()

if __name__=="__main__":
    draw_station()