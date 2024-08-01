$fn=50;

Tarugo = 10;           // Medida del tarugo


Espesor = 1;           // Espesor de las paredes del tarugo

Alto = 3*Tarugo;       // Alto del tarugo

DifRadios = 1;


module __Insercion(R=Tarugo/2){
    union(){
        for (i = [ 0 : 4 ]){
            translate([0,0,Alto/32+Alto/8*i])
                cylinder(r1 = R, r2 = R - DifRadios, h = Alto/16, center=true);
        }
        for (i = [ 1 : 4 ]){
            translate([0,0,-Alto/32+Alto/8*i])
                cylinder(r2 = R, r1 = R - DifRadios, h = Alto/16, center=true);
        }
    }
}
module __InsercionHueca(){
    difference(){
        __Insercion(R=Tarugo/2);
        translate([0,0,-Alto/8])
        __Insercion(R=Tarugo/2-Espesor);
        cylinder(r=Tarugo/2-Espesor-DifRadios, h=2*Alto, center=true);
    }
}

module __Cuerpo(){
    // 
    //
    union(){
        translate([0, 0, -Alto/4])
            difference(){
                cylinder(r = Tarugo/2, h = Alto/2, center=true);
                cylinder(r = Tarugo/2-Espesor, h = Alto/2+1, center=true);
            }
        translate([0, 0, -Alto/2 - Espesor/2])
            difference(){
                cylinder(r = Tarugo/2+Espesor, h = Espesor, center=true);
                cylinder(r = Tarugo/2-Espesor, h = Espesor+1, center=true);
            }
    }
}



module Tarugo(){
    difference(){
        union(){ // El Tarugo
            __InsercionHueca();
            __Cuerpo();
            translate([0,0,+Alto/2+Espesor/2 + Tarugo/16 + Tarugo/32])
                cylinder(r=Tarugo/2-Espesor-DifRadios,h=Espesor,center=true);

        }

        translate([0,0,4*Espesor])
            cube([1.5*Espesor, 2*Tarugo, Alto],center=true);

    }


}
