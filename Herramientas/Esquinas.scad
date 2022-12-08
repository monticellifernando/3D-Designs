$fn=50;
use <roundedcube_simple.scad>

module Agujero(){
    union(){
        cylinder(h=15, r=2.5);
        translate([0,0,5]) cylinder(h=6,r1=2.5,r2=5);
        
    }
}

module Planchita(){
    difference(){
        roundedcube_simple([40,20,10],radius=3);
        translate([30,10,-0.1]) Agujero();
        }
}


module Esquina(){
    union(){
        Planchita();
        translate([0,20,0]) rotate([0,-90,180]) Planchita();
        translate([17,20,0]) rotate([90,-45,0]) roundedcube_simple([12,25,20],radius=3);
        }
}

rotate([90,0,0]) Esquina();
    
    