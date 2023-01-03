$fn=75;

DiametroArriba=10; // Boca del plato en mm
DiametroAbajo=12;   // Base del plato en mm
Altura=5;          // Altura del plato en mm
Espesor=3;          // Espesor de las paredes del plato en mm
TornilloDiametro=4.8; // Diámetro del tornillo

module AgujeroTornillo(Alto,Diametro){
    translate([0,0,-0.1]) cylinder(h=Alto, r=Diametro/2);
}
module Casco(DiametroMayor, DiametroMenor, Alto, Espesor){
    difference(){
            cylinder(h=Alto, r2=DiametroMayor/2, r1=DiametroMenor/2);
            translate([0,0,Espesor/1.5]) cylinder(h=Alto, r1=DiametroMenor/2-Espesor/2, r2=DiametroMayor/2-Espesor/2);
        };
    }
    
module PataChasis(DiametroMayor, DiametroMenor, Alto, Espesor, TornilloDiametro){
    difference(){
        Casco(DiametroMayor, DiametroMenor, Alto, Espesor);
        AgujeroTornillo(Alto,TornilloDiametro);
        
    };
    
}


PataChasis(DiametroMayor=DiametroArriba, DiametroMenor=DiametroAbajo, Alto=Altura, Espesor=Espesor, TornilloDiametro=TornilloDiametro);
//CascoConAgujero(DiametroMayor=DiametroArriba, DiametroMenor=DiametroAbajo, Alto=Altura, Espesor=Espesor);

