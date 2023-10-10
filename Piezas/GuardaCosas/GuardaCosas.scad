$fn=50;

use<../../threads-scad/threads.scad>


module Rosa(diametro=20, largo=20, diametro_agujero=1){

    // Cono invertido
    difference(){
        // Estructura de la rosa
        Cono(largo, diametro, 31,1);
        // difference(){
        //     cylinder(h=largo,r1=diametro/2, r2=15);
        //     translate([0,0,1]) cylinder(h=largo,r1=diametro/2-2, r2=15-2);
        // }
        // Los agujeros
        translate([0,0,-1]) Agujeros(diametro, diametro_agujero);
    }
    translate([0,0,largo]) Cono(5,31,15,-2);

    // Ahora la rosca!
    translate([0,0,largo])
    ScrewHole(outer_diam = 28, height=15, pitch=2.5,  tooth_angle=45)
        cylinder(h=10  ,r=15.5);
    
}




Rosa(diametro=20, largo=20, diametro_agujero=1.5);

