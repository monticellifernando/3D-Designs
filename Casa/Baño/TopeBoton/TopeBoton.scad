$fn = 64;

Diam = 16;
Ancho = 30;
Profundidad = 19;
Largo = 70;



difference(){
    cube([Ancho, Profundidad, Largo+1], center = true); 
        translate([0,0,-Largo/2+4]) rotate([90,0,0]) cylinder(d = Diam, h = 2*Largo, center = true); 
}
