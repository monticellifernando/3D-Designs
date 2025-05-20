$fn=32;

Alto=10;
Diametro=4;
Espesor=2;



difference(){
    cylinder(d=Diametro+2*Espesor,h=Alto, center=true);
    cylinder(d=Diametro,h=Alto+1, center=true);
}
