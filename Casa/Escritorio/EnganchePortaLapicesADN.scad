$fn=75;

Diametro = 2.5;
Distancia = 10;
Largo = 10;


cube([Distancia+Diametro+2, Diametro+2,2],center=true);
for (i =[-Distancia/2, Distancia/2]){
    translate([i,0,Largo/2])
        cylinder(r=Diametro/2, h=Largo, center=true);

}
