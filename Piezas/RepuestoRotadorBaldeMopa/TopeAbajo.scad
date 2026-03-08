$fn=64;


DInt  = 9; 
DExt = DInt + 10;

Altura = 18;

difference(){
    cylinder(d = DExt, h = Altura, center = true);
    cylinder(d = DInt, h = Altura+1, center = true);
}
