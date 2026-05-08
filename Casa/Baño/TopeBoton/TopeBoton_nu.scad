$fn = 64;


Diam = 32/3.14 + 2;  // Diametro del pituto del botón
Largo = 10; // Cuánto adicional hay que alargar el pituto
DiamExt = Diam+5; // El diametro externo. El pituto va encastrado ADENTRO y atornillado
Profundidad = 5; // Cuanto el pituto va metido dentro del alargue este

//Tornillo
D_Cabeza   = 9; // Cabeza del tornillo
D_Tornillo = 4.5; // Cuerpo del tornillo

L_Tornillo = Profundidad +1;
L_Cabeza   = Largo + Profundidad + 1;

Transicion = 3;

module Tornillo (){

    translate([0,0,L_Cabeza/2 + Transicion-0.1])
    cylinder(d = D_Cabeza, h = L_Cabeza, center=true);
    translate([0,0,Transicion/2])
    cylinder(d2 = D_Cabeza, d1 = D_Tornillo, h = Transicion, center=true);
    translate([0,0,-L_Tornillo/2 + Transicion/2+0.1])
    cylinder(d = D_Tornillo, h = L_Tornillo, center=true);
}

module Alargue(){
    difference(){
        cylinder(d = DiamExt, h = Largo + Profundidad, center = true);
        translate([0,0,-Profundidad-0.1])
        cylinder(d = Diam, h = Profundidad, center = true);
    }

}

module Pituto(){
    difference(){
        Alargue();
        Tornillo();
    }
}

Pituto();
