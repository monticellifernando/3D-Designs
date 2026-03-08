$fn = 64;

Diam = 15;
Agujero = 6.5;
Largo = 50;

difference(){
    cylinder(d = Diam, h = Largo, center = true); 
    cube([Agujero, Agujero, Largo+1], center = true); 
}
