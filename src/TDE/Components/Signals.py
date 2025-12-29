class Torch:
    def __init__(self,color:str, coordinates:list[tuple[int,int]]):
        self.color = color
        self.coordinates = coordinates

    def get_color(self):
            return self.color

    def get_coordinates(self):
        return self.coordinates

    def change_color(self,color:str):
        self.color = color

class Circle_Torch(Torch):
    def __init__(self, center_x:int, center_y:int):
        radious = 10
        coord0 = (center_x-radious,center_y-radious)
        coord1 = (center_x+radious,center_y+radious)
        super().__init__("red",[coord0, coord1])
    
class Square_Torch(Torch):
    def __init__(self, center_x:int, center_y:int):
        size = 10
        coord0 = (center_x-size,center_y-size)
        coord1 = (center_x+size,center_y-size)
        coord2 = (center_x+size,center_y+size)
        coord3 = (center_x-size,center_y+size)
        super().__init__("red",[coord0,coord1,coord2,coord3]) 

class Foot_Signal:
    def __init__(self,x0:int, y0:int,direction:int):
        self.coord0 = (x0,y0)
        self.coord1 = (x0,y0-20)
        self.coord2 = (x0+5*direction,y0-20)
        self.coord3 = (x0+5*direction,y0-12)
        self.coord4 = (x0+35*direction,y0-12)
        self.coord5 = (x0+35*direction,y0-8)
        self.coord6 = (x0+5*direction,y0-8)
        self.coord7 = (x0+5*direction,y0)
        self.color = "red"
    
    def activate_foot_signal(self):
        self.color = "yellow"

    def deactivate_foot_signal(self):
        self.color = "red"
    
    def get_color(self):
        return self.color
    
    def get_coordinates(self):
        return [self.coord0,
                self.coord1,
                self.coord2,
                self.coord3,
                self.coord4,
                self.coord5,
                self.coord6,
                self.coord7]
    
class Signal:
    def __init__(self,name:str, torch: Torch, foot_signal: Foot_Signal):
        self.name = name
        self.torch = torch
        self.foot_signal = foot_signal

    def get_foot_signal_coordinates(self):
        return self.foot_signal.get_coordinates()

    def get_torch_signal_coordinates(self):
        return self.torch.get_coordinates()

    def get_foot_signal_color(self):
        return self.foot_signal.get_color()
    
    def get_torch_signal_color(self):
        return self.torch.get_color()

class Circle_Signal(Signal):
    def __init__(self, name:str, x0:int, y0:int,direction:int):
        foot_signal = Foot_Signal(x0, y0,direction)
        torch = Circle_Torch(x0+35*direction, y0-10)
        super().__init__(name, torch, foot_signal)
    
class Square_Signal(Signal):
    def __init__(self,name:str, x0:int, y0:int,direction):
        foot_signal = Foot_Signal(x0, y0,direction)
        torch = Square_Torch(x0+35*direction, y0-10)
        super().__init__(name, torch, foot_signal)