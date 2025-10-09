$fn=50;
Alto=95;
Ancho=100;

Espesor = 2; 

AlturaAgarre=7;
AlturaTotal = Espesor + AlturaAgarre;

DiametroCilindro = 48.5;

Tope = 5 ; // Espesor del tope en la parte inferior

y_Offset = Alto/2 - (30+DiametroCilindro/2);

difference(){
    union(){
        cube([Ancho, Alto, Espesor], center=true);
        translate([0,y_Offset,AlturaTotal/2])
        {
            cylinder(d1=DiametroCilindro+4*Espesor, d2 = DiametroCilindro+ Espesor , h=AlturaTotal, center=true);
            cylinder(d2=DiametroCilindro+4*Espesor, d1 = DiametroCilindro+ Espesor , h=AlturaTotal, center=true);
        }
    }

    translate([0,y_Offset,AlturaTotal/2])
    cylinder(d=DiametroCilindro, h=AlturaTotal+Espesor+1, center=true);

}
// Borde de 5mm
translate([0,-Alto/2+Tope/2, Espesor/2 + Tope/2])
        cube([Ancho, Tope, Tope], center=true);
