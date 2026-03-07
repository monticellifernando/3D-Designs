$fn=60;

DTornillo = 7;
DAgujero = 13;
DTope = 17;
Espesor = 10;

difference(){
    union(){
cylinder(d=DAgujero, h=Espesor);
cylinder(d=DTope, h=2, center=true        );
    }
    cylinder(d=DTornillo, h=3*Espesor, center=true);
}

