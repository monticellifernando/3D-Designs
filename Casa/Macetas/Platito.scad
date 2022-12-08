$fn=75;

DiametroArriba=110; // Boca del plato en mm
DiametroAbajo=95;   // Base del plato en mm
Altura=20;          // Altura del plato en mm
Espesor=1;          // Espesor de las paredes del plato en mm
Aro=2;              // Tamaño del aro del plato en mm


module Platito(DiametroMayor=DiametroArriba, DiametroMenor=DiametroAbajo, Alto=Altura, Espesor=Espesor){

difference(){
    union(){
        cylinder(h=Alto, r2=DiametroMayor/2, r1=DiametroMenor/2);
        translate([0,0,Alto-(Aro+0.01)])cylinder(h=3, r=DiametroMayor/2+Aro);
    }        
    translate([0,0,Espesor]) cylinder(h=Alto, r1=DiametroMenor/2-Espesor/2, r2=DiametroMayor/2-Espesor/2);
    };
}

Platito();

