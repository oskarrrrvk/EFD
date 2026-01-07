from Components.Rail import HorizontalRail, VerticalRail

class Sw_1A(HorizontalRail):
    def __init__(self,x0:int,y0:int,x_length:int):
        super().__init__("1A",x0,y0,x_length)

class Sw_1(HorizontalRail):
    def __init__(self,x0:int,y0:int,x_length:int):
        super().__init__("1",x0,y0,x_length,"white")

class Sw_2R(HorizontalRail):
    def __init__(self,x0:int,y0:int,x_length:int):
        super().__init__("2R",x0,y0,x_length)

class Sw_3R(HorizontalRail):
    def __init__(self,x0:int,y0:int,x_length:int):
        super().__init__("3R",x0,y0,x_length)

class Sw_3RA(HorizontalRail):
    def __init__(self,x0:int,y0:int,x_length:int):
        super().__init__("3RA",x0,y0,x_length)

class Sw_2L(VerticalRail):
    def __init__(self, x0:int, y0:int, direction_x:int, direction_y:int):
        super().__init__("2L",x0,y0,direction_x,direction_y)

class Sw_3L(VerticalRail):
    def __init__(self, x0:int, y0:int, direction_x:int, direction_y:int=10):
        super().__init__("3L",x0,y0,direction_x,direction_y)

class sw_3LA:
    def __init__(self,color):
        self.color = color

class Sw_3LA_Vertical(VerticalRail):
    def __init__(self, x0:int, y0:int, direction_x:int, direction_y):
        super().__init__("3LA",x0,y0,direction_x,direction_y)

class Sw_3LA_Horizontal(HorizontalRail):
    def __init__(self, x0:int, y0:int, x_length:int):
        super().__init__("3LA",x0,y0,x_length)


class Switch:
    def __init__(self,name:str,sw1A:Sw_1A, sw1:Sw_1, sw2R:Sw_2R, 
                 sw3R:Sw_3R, sw3RA:Sw_3RA, sw2L:Sw_2L, sw3L:Sw_3L, sw3LA:list[Sw_3LA_Horizontal|Sw_3LA_Vertical]):
        self.name = name
        self.sw1A = sw1A
        self.sw1 = sw1
        self.sw2R = sw2R
        self.sw3R = sw3R
        self.sw3RA = sw3RA
        self.sw2L = sw2L 
        self.sw3L = sw3L
        self.sw3LA = sw3LA

    def get_coordinates(self):
        return [self.sw1A.get_coords(),
                self.sw1.get_coords(),
                self.sw2R.get_coords(),
                self.sw3R.get_coords(),
                self.sw3RA.get_coords(),
                self.sw2L.get_coords(),
                self.sw3L.get_coords()] + [sw.get_coords() for sw in self.sw3LA] 

    def get_color(self):
        return [self.sw1A.get_color(),
                self.sw1.get_color(),
                self.sw2R.get_color(),
                self.sw3R.get_color(),
                self.sw3RA.get_color(),
                self.sw2L.get_color(),
                self.sw3L.get_color()] + [sw.get_color() for sw in self.sw3LA]
    
    def get_name(self):
        return self.name
    
    def set_switch_state(self,colorR:str, colorL:str, color1:str, color1A:str):
        self.sw1A.change_color(color1A)
        self.sw1.change_color(color1)
        self.sw3R.change_color(colorR)
        self.sw3RA.change_color(colorR)
        self.sw3L.change_color(colorL)
        for sw in self.sw3LA:
            sw.change_color(colorL)

    def set_normal_direction(self,color:str):
        self.set_switch_state(color,"yellow","blue",color)
        self.sw2L.change_color("black")
        self.sw2R.change_color(color)

    def set_reverse_direction(self,color:str):
        self.set_switch_state("yellow",color,"blue",color)
        self.sw2R.change_color("black")
        self.sw2L.change_color(color)

    def ocupy_swith_in_step_train(self):
        self.set_switch_state("red","red","blue","red")
        self.sw2R.change_color("red")
        self.sw2L.change_color("red")

    def ocupy_switch_unexpectively(self):
        self.set_switch_state("red","red","white","red")
        self.sw2R.change_color("red")
        self.sw2L.change_color("red")

    def reset_state(self):
        self.set_switch_state("yellow","yellow","white","yellow")

    def reset_normal_direction(self):
        self.sw2L.change_color("black")
        self.sw2R.change_color("yellow")
        self.reset_state()
    
    def reset_reverse_direction(self):
        self.sw2R.change_color("black")
        self.sw2L.change_color("yellow")
        self.reset_state()

    def set_id(self,id:list[int]):
        self.id = id

    def get_id(self):
        return self.id

class SwitchLeft(Switch):
    def __init__(self,name:str, x0:int, y0:int):
        sw1A = Sw_1A(x0,y0,50)
        sw1 = Sw_1(x0-20,y0,20)
        sw2R = Sw_2R(x0-60,y0,40)
        sw3R = Sw_3R(x0-100,y0,40)
        sw3RA = Sw_3RA(x0-170,y0,70)
        sw2L = Sw_2L(x0-17,y0,-1,-1)
        sw3L = Sw_3L(x0-27,y0-30,-1,-1)
        sw3LA = [Sw_3LA_Vertical(x0-37,y0-60,-1,-1),
                  Sw_3LA_Vertical(x0-47,y0-90,-1,-1),
                  Sw_3LA_Vertical(x0-57,y0-120,-1,-1),
                  Sw_3LA_Horizontal(x0-170,y0-150,103)
                ]
        super().__init__(name,sw1A,sw1,sw2R,sw3R,sw3RA,sw2L,sw3L,sw3LA)

class SwitchRight(Switch):
    def __init__(self,name:str, x0:int, y0:int):
        sw1A = Sw_1A(x0,y0,50)
        sw1 = Sw_1(x0+50,y0,20)
        sw2R = Sw_2R(x0+70,y0,40)
        sw3R = Sw_3R(x0+110,y0,40)
        sw3RA = Sw_3RA(x0+150,y0,70)
        sw2L = Sw_2L(x0+67,y0,1,-1)
        sw3L = Sw_3L(x0+77,y0-30,1,-1)
        sw3LA = [Sw_3LA_Vertical(x0+87,y0-60,1,-1),
                 Sw_3LA_Vertical(x0+97,y0-90,1,-1),
                 Sw_3LA_Vertical(x0+107,y0-120,1,-1),
                Sw_3LA_Horizontal(x0+117,y0-150,103)
                ]
        super().__init__(name,sw1A,sw1,sw2R,sw3R,sw3RA,sw2L,sw3L,sw3LA) 