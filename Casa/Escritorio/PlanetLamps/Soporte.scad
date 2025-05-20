$fn=32;

Espesor=1.2; 

DiametroAbajo=45;
DiametroInternoArriba=63;
DiametroExternoArriba=84;
DiametroAgujeros = 3;
Altura = 17;


module Solido(){
    // Primero cilindro que entra en la cavidad:
    cylinder(d=DiametroAbajo, h=5, center=true);

    // Ahora el "cono"
    translate([0,0,5/2+Altura/2]) cylinder(d2=DiametroInternoArriba, d1=DiametroAbajo, h=Altura, center=true);

    //Ahora el disco que apoya arriba
    translate([0,0,5/2+Altura+Espesor/2]) cylinder(d=DiametroExternoArriba,  h=Espesor, center=true);

}

difference(){
    Solido();
    translate([0,0,+Altura/2])
        cylinder(d=DiametroAbajo-2*Espesor, h=5+Altura+Espesor+10, center=true);
    translate([0,0,5/2+Altura/2+Espesor+.1]) cylinder(d2=DiametroInternoArriba-2*Espesor, d1=DiametroAbajo-2*Espesor, h=Altura, center=true);
    // Los agujeros
    for ( i = [ 0 : 60 : 360  ]){
        rotate([0,0,i])
            translate([71/2,0,Altura+5/2]) cylinder(d=DiametroAgujeros, h=5,center=true);
    }
}




//





