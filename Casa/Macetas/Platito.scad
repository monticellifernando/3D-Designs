$fn=75;

module Platito(DiametroMayor=110, DiametroMenor=95, Alto=20, Espezor=1){

difference(){
    cylinder(h=Alto, r2=DiametroMayor/2, r1=DiametroMenor/2);
    translate([0,0,Espezor]) cylinder(h=Alto, r1=DiametroMenor/2-Espezor/2, r2=DiametroMayor/2-Espezor/2);
    };
}

Platito();

