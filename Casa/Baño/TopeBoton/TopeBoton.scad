$fn = 64;

Diam = 40;

Ancho = 40;
Profundidad = 100;
Largo = 80;

difference(){
    rotate([0,-60,0]) 
        difference(){
            cylinder(d=Diam, h=2*Diam, center = true);
            cylinder(d=2, h=2*Largo, center = true);
        }
//difference(){
//    rotate([0,-60,0]) 
//        difference(){
//            cylinder(d=25, h=30, center = true);
//            cylinder(d=25, h=30, center = true);
//        }
    translate([-Ancho,0,0]) cube([Ancho+1, Profundidad+1, Largo+1], center = true);


}
