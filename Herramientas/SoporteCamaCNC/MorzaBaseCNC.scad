include <ParametrosCamaCNC.scad>;
use <EnchufeBaseCNC.scad>

module Morza(){
    union(){
        Tubos(-0.5);
        Frente();
    }
}

module MuescaTornillo(){

        translate([0, -DistanciaAgujeros/2-DiametroAgujeros+1.5,Altura-1])
            rotate([90,0,0])
            cylinder(r1=3.5/2, r2=0, h=2, center=true);
}

module Frente(){
    union(){
        translate([0, -DistanciaAgujeros/2-DiametroAgujeros,Altura-1])
            cube([DistanciaAgujeros+DiametroAgujeros,DiametroAgujeros,Altura],center=true);
        translate([0, -DistanciaAgujeros/2-1.33*DiametroAgujeros,Altura])
            rotate([20,0,0])
            cube([DistanciaAgujeros+DiametroAgujeros,DiametroAgujeros/2,Altura],center=true);

    }
}

//Enchufe();
Morza();
MuescaTornillo();
