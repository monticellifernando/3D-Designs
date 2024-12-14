$fn=75;

DiametroArriba=55;  // Boca del plato en mm
DiametroAbajo=110;   // Base del plato en mm
Altura=10;          // Altura del plato en mm
AlturaAgarre=5;          // Altura del agarre en mm
Espesor=3;          // Espesor de las paredes del plato en mm
AlturaPlaca = 8;    // Altura de la placa usb
AnchoPlaca = 14;    // Ancho de la placa

//Agarres
DiametroAgarre = 2.5; 
SeparacionAgarres = 9; 
DistanciaAlBorde = 10;

module BaseSolida(){

        cylinder(h=Altura, r=DiametroAbajo/2+Espesor/2, center=true);
        translate([0,0,(Altura+AlturaAgarre)/2-0.1])
            cylinder(h=AlturaAgarre, r=DiametroArriba/2, center=true);

}

module Base(Texto="Nombre"){

    difference(){
        BaseSolida();
        translate([0,0,-Espesor+AlturaAgarre/2])
            cylinder(h=AlturaAgarre+Altura, r=DiametroArriba/2- Espesor/2, center=true);
        // translate([0,0,-2*Espesor ])
        //     cylinder(h=Altura, r=DiametroAbajo/2- Espesor/2, center=true);
        
        for (i = [0, 120, 240]){
            rotate([0,0,i])
                translate([0,DiametroArriba*0.6 /2 ,(Altura+AlturaAgarre)/2-0.1])
                cylinder(h=2*AlturaAgarre, r=2,center=true);


        }
        translate([DiametroAbajo/2-0.1,0,-Altura/2+AlturaPlaca/2-0.01])
                cube([DiametroAbajo, AnchoPlaca, AlturaPlaca], center=true);

    //    translate([0,0,-Espesor])
        translate([-DiametroAbajo/4,-DiametroAbajo*0.8 /2 ,(Altura)/2-2])
            Texto(Texto);

    }

    //AgregarLosAgarres
    for (i = [-SeparacionAgarres/2, SeparacionAgarres/2]){
        translate([DiametroAbajo/2-DistanciaAlBorde,i,-Altura/2+AlturaPlaca/2])
            cylinder(h=AlturaPlaca, r= DiametroAgarre/2, center=true);
    }

}


module Texto(texto){
    //scale(0.75)
    //translate([-5,1, 20])
        //rotate([90,90,0])
        linear_extrude(height = 3) {
            text(texto, font = ":Bold");
        }
}

