$fn=40;

Circunferencia = 2*130;
D = Circunferencia/3.14159;
e=1.2;

difference(){

    cylinder(d=D,h=e,center=true);
    cylinder(d=D-2*e,h=e+1,center=true);
}
