//$fn=75;

// Altura=5;   // Altura del plato en mm
// DistanciaAgujeros = 20;
// DiametroAgujeros = 5;
include <ParametrosCamaCNC.scad>;

module Enchufe(){
    difference(){
        union(){
            Patas();
            Tubos();
            Frentes();
        }
        Agujeros();
    }
}

module Frentes(){
    i=0;
    //union(){
    //    for (i = [0:1]){
            translate([0,-DistanciaAgujeros/2+i*DistanciaAgujeros,Altura-1])
                Frente();

    //    }
    //}
}


module Frente(){
        cube([DistanciaAgujeros, DiametroAgujeros, 1.5*DiametroAgujeros], center=true);
}


module Tubos(Diametro = DiametroAgujeros, LargoAdicional=0){
    union(){
        for (i = [0:1]){
            translate([-DistanciaAgujeros/2 + i*DistanciaAgujeros,0,Altura-1])
                Tubo(Diametro/2,LargoAdicional);

        }
    }
}


module Tubo(Diametro=DiametroAgujeros,LargoAdicional=0){
    // Este es el tubo por el que se deslizan las barras de la morcita
    // Vamos a usar el mismo set de agujeros/diametros de las patas

    rotate([90,0,0])
//        difference(){
            cylinder(h=DistanciaAgujeros+DiametroAgujeros+LargoAdicional, r = Diametro/2+Altura/2,center=true);
//            cylinder(h=DistanciaAgujeros+DiametroAgujeros+1, r = DiametroAgujeros/2+0.25,center=true);
//        }




}

module Pata(){
    cylinder(h = 1.5*Altura-1, r = DiametroAgujeros/2-0.25);
}

module Patas(){
    union(){
        for (i = [ 0: 1]){
            for ( j= [0: 1]){
                translate([-DistanciaAgujeros/2+i*DistanciaAgujeros,-DistanciaAgujeros/2+j*DistanciaAgujeros,-Altura+1])
                    Pata();
            }
        }
    }
}

module MuescaTuerca(){
    // Exagono para la tuerca
    r=4;
    h=3;
    A = Altura*2;

     union(){
         rotate([90,0,0])
             cylinder(r=r, h=h, $fn=6,center=true);
         translate([0,0,A/2])
             cube([2*r,h,A],center=true);
     }
}

module Agujeros(){
    union(){
        Tubos(DiametroAgujeros/2, 1);
        translate([0,-DistanciaAgujeros/2,Altura-1])
            MuescaTuerca();
        AgujeroTornillo();
    }
}

module AgujeroTornillo(){
    translate([0,-DistanciaAgujeros/2,Altura-1])
        rotate([90,0,0])
        cylinder(r=3.5/2,h=10,center=true);
}


Enchufe();
//MuescaTuerca();a
//Agujeros();

