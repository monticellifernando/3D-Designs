$fn=50;

use<../../threads-scad/threads.scad>

module Cono(largo, diametro1, diametro2, desplazamiento=1){
        difference(){
            cylinder(h=largo,r1=diametro1/2, r2=diametro2/2);
            translate([0,0,desplazamiento]) cylinder(h=largo+2*abs(desplazamiento),r1=diametro1/2-2*abs(desplazamiento), r2=diametro2/2-2*abs(desplazamiento));
        }
}

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

module Agujeros(diametro, diametro_agujero){
    // 8 tiras de agujeros cada 45⁰ hasta el 90% del diametro
    Agujeros_por_tira = ((diametro-diametro_agujero/2)/2)*0.9/(2*diametro_agujero);
    for (angulo = [ 0 : 7]) {
        for ( i = [ 1 : Agujeros_por_tira]){
            rotate ([0,0,45*angulo]) translate([i*2*diametro_agujero,0,0]) cylinder(h=5,r=diametro_agujero/2);
        }

    }
    // Un agujero central de 1.5mm
    cylinder(h=5,r=0.75);
}



Rosa(diametro=20, largo=20, diametro_agujero=1.5);

