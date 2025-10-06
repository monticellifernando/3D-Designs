$fn=50;
Largo= 30;
Base=5;
Espesor = 2; 

DiametroExt = 15;
DiametroInt = 12;
DiametroAgujero = 9;

difference(){
    union(){
        cylinder(d=DiametroInt, h=Largo, center=true);
        translate([0,0,-Largo/2+Base/2]) cylinder(d=DiametroExt, h = Base, center=true);
        for (i = [0, 90]){
            rotate([0,0,i]) cube([DiametroExt, Espesor, Largo], center = true);
        }
    }
    translate([0,0,-Espesor]) cylinder(d=DiametroAgujero, h= Largo, center=true);


}

// Ahora el Aro que hace "click" en la muesca del embolo

DesplazamientoAro = 11;

translate([0,0,Largo/2 - Espesor - DesplazamientoAro]) difference(){
    cylinder(d=DiametroInt, h = Espesor, center = true);
    cylinder(d2=DiametroAgujero-1.5, d1=DiametroAgujero, h = Espesor+0.1, center = true);

}
