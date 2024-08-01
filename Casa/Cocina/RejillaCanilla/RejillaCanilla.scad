$fn=50;
Diametro = 16; // Diametro de la rejilla
Alto = 3;       // Alto de la rejilla
Separacion = 2; // Separación de la malla
Ancho = 0.4;     // Ancho de cada hilo de la malla


module __Malla(){
    // 
    //
    hilos = Diametro/(Separacion);
    echo(hilos);
    for (i = [ 0 : hilos]){
        translate([-Diametro/2 +i * (Separacion),0,0])
            cube([Ancho, Diametro, Alto], center=true);

    }
    for (i = [ 0 : hilos]){
        translate([0, -Diametro/2 +i * (Separacion),0])
            cube([Diametro, Ancho, Alto], center=true);

    }
    
}

module __Aro(){
    difference(){
        cylinder(r=Diametro/2, h=Alto, center=true);
        cylinder(r=Diametro/2 - Ancho, h=Alto+1, center=true);
    }
}


module Rejilla(){
    intersection(){
        __Malla();
        cylinder(r=Diametro/2, h=Alto, center=true);
    }
    __Aro();
}
