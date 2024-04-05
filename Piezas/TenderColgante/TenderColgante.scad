$fn=50;
use <roundedcube_simple.scad>


diametro=6;



module AgarreEsquina(){

    difference(){
        roundedcube_simple([40,10,10],radius=3,center=true);
        for ( i = [ -12.5, 12.5 ] ){
            translate([i,0,0]) cylinder(h=15,r=diametro/2, center=true);
        }

    }
}

module AgarreCuerdas(){

    difference(){
        roundedcube_simple([30,30,10],radius=3,center=true);
        for ( i = [ -7.5, 7.5 ] ){
            for (j = [ -7.5, 7.5 ]){
                translate([i,j,0]) cylinder(h=15,r=diametro/2, center=true);
            }
        }
        cylinder(h=15,r=diametro/2, center=true);

    }
}

// AgarreCuerdas();

