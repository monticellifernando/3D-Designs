$fn=50;
Diametro = 5; // Diametro del agarre en el alambre
Separacion = 35; // Separación a la pared
Alto = Separacion; //10;       // Alto del tope
Ancho = 3*Separacion/4;     // Ancho del tope
Espesor = 5;    // Espesor del agarre al secaplatos

module __Cuerpo(){
    // 
    //
    difference(){
        cube([Ancho, Separacion+ Diametro, Alto], center=true); // Cuerpo principal

        translate([0,Espesor,0]){

            cube([Ancho+1, Separacion+ Diametro-3*Espesor, Alto-Espesor], center=true); // Cuerpo principal
            cube([Ancho-Espesor, Separacion+ Diametro-3*Espesor, Alto+1], center=true); // Cuerpo principal
        }

                                                                
        // cilindro por donde encastra en el secaplatos
        translate([0, -Separacion/2+Espesor/2,Alto/2-Espesor/2-Diametro/2])
            rotate([0,90,0])
            cylinder(r=Diametro/2, h=Ancho+1, center=true);

        // Corto el cilindro para que pueda encastrar
        translate([0, -(Separacion+ Diametro)/2, -(Diametro+Espesor)/2])
            cube([Ancho+1, Diametro+Espesor ,Alto], center=true);

        // Y hago un encas


        // Corte vertical para que pase el tejido vertical y no deslice de costado
        translate([0, -(Separacion+ Diametro)/2, 0])
            cube([Diametro, 2*Diametro, Alto+1], center=true);
    }
    
}



module TopeSecaPlatos (){
    union(){
        __Cuerpo();
    }
}
