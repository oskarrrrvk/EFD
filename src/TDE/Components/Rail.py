class Rail:
    def __init__(self, coords0:tuple[int,int],coords1:tuple[int,int],coords2:tuple[int,int],coords3:tuple[int,int],name:str,color:str):
        self.coords0 = coords0
        self.coords1 = coords1
        self.coords2 = coords2
        self.cords3 = coords3
        self.name = name
        self.color = color

    def change_color(self, color:str):
        self.color = color

    def get_name(self):
        return self.name
    
    def get_color(self):
        return self.color

    def get_coords(self):
        return [self.coords0, self.coords1, self.coords2, self.cords3]
    
    def set_id(self,id:int):
        self.id = id
    
    def get_id(self):
        return self.id

class HorizontalRail(Rail):
    def __init__(self, name:str, x0:int, y0:int, x_length:int, color:str="yellow"):
        xn = x0 + x_length
        yn = y0 + 10
        super().__init__((x0,y0),(xn,y0),(xn,yn),(x0,yn),name,color)

class VerticalRail(Rail):
    def __init__(self, name:str, x0:int, y0:int,dir_x:int, dir_y:int):
        y_length = 30
        x_length = 10
        xn = x0 + x_length * dir_x
        x3 = xn + x_length * dir_x
        yn = y0 + y_length * dir_y
        super().__init__((x0,y0),(xn,y0),(x3,yn),(xn,yn),name,"yellow") 