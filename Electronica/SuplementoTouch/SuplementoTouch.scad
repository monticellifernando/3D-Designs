$fn=32;

Alto=8;
Diametro=5;
Espesor=2;



cylinder(d=Diametro,h=Alto, center=true);
translate([0,0,-Alto/2+Espesor/2]) 
    cylinder(d=10,h=Espesor, center=true);
