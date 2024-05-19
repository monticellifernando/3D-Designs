$fn=50;
use <roundedcube_simple.scad>

espesor=2;

Ancho  = 100; 
Largo  = 110; 
Altura =  40; 

RSujetadores = 7;
Rtornillo = 3;


module AgujeroBoton(){
    cylinder(h=2*espesor, r=13);
}




module AgujeroPalanca(){

    cylinder(h=2*espesor, r=7.5);
    for (y=[40.5, -40.5]){
        for (x = [22, -22]) {

            translate([x,y,0]) cylinder(h=2*espesor, r=2);
        }
    }
}

module MuecaTuerca(){

    m_Largo = Largo/2-espesor-RSujetadores;
    m_Ancho = Ancho/2-espesor-RSujetadores;
    translate([sqrt(m_Ancho*m_Ancho+m_Largo*m_Largo),0,0])
    rotate([0,0,180]){
        cylinder(r=5, h=4, center=true, $fn=6);
        translate([5,0,0]) cylinder(r=5, h=4, center=true, $fn=6);
    }
}

module InteriorTapa(){
    translate([0,0,-espesor]){
        difference(){
            roundedcube_simple([Ancho-espesor,Largo-espesor,Altura],radius=8, center=true);
            for (x = [-Ancho/2+espesor+RSujetadores, Ancho/2-espesor-RSujetadores]){
                for (y = [-Largo/2+espesor+RSujetadores, Largo/2-espesor-RSujetadores]){

                    m_Angle = 20;

                    if ( x > 0 && y > 0 ) {}

                    Anglex = - y/ abs(y) * m_Angle ;
                    Angley =  x/ abs(x) * m_Angle ;

                    translate([x+Altura/4*sin(Angley),y-Altura/4*sin(Anglex),0])           rotate([Anglex, Angley ,0]) cylinder(r=RSujetadores, h= Altura, center=true);
                    //translate([x*1.03,y*1.03,0]) rotate([Anglex, Angley ,0]) cylinder(r=RSujetadores, h= Altura, center=true);


                }

            }


        }
    }

    translate([0,0,-Altura/2+4]){
        cube([Ancho*2, Largo*2, 8], center=true);
    }

    for (x = [-Ancho/2+espesor+RSujetadores, Ancho/2-espesor-RSujetadores]){
        for (y = [-Largo/2+espesor+RSujetadores, Largo/2-espesor-RSujetadores]){

            translate([x,y,-Altura/4]) cylinder(r=Rtornillo, h= Altura, center=true);


        }

    }
}

module Tapa(){
    difference(){
        roundedcube_simple([Ancho, Largo, Altura],radius=8, center=true);
        
        // Hueco
        InteriorTapa();
        
        // Muecas para tuercas
        for ( x = [90,-90]){
            m_Largo = Largo/2-espesor-RSujetadores/2;
            m_Ancho = Ancho/2-espesor-RSujetadores/2;

            for (angle = [atan(m_Ancho/m_Largo), atan(-m_Ancho/m_Largo)]){
                    rotate([0,0,angle+x]) MuecaTuerca();
                    }
        }

        // Agujero palanca
        translate([15,0,Altura/2 - 2*espesor]) AgujeroPalanca();
        
        // Agujero Boton
        translate([-30,Largo/4,Altura/2 - 2*espesor]) AgujeroBoton();

        // Agujero Cable
        translate([0, Largo/2, 0]) rotate([90,0,0]) cylinder(r=4, h= 4*espesor, center=true);
        translate([0, Largo/2, -Altura/2])  cube([8, 4*espesor, Altura], center=true);

    }
}


module InteriorBase(){
    translate([0,0,-Altura/4-espesor]){
            roundedcube_simple([Ancho-3*espesor,Largo-3*espesor,Altura],radius=8, center=true);
    }
}

module SacabocadosBase(){
    translate([0,0,-Altura/2])
    difference(){
        cube([Ancho*1.1, Largo*1.1, Altura],center=true);
        translate([0,0,Altura/2]) roundedcube_simple([Ancho-espesor-1, Largo-espesor-1, Altura],center=true, radius=8);
    }
}

module PatasSoporte(Margen=0){
    for (x = [-Ancho/2+espesor+RSujetadores, Ancho/2-espesor-RSujetadores]){
        for (y = [-Largo/2+espesor+RSujetadores, Largo/2-espesor-RSujetadores]){

            translate([x,y,Altura/8]) {
            cylinder(r=RSujetadores+Margen, h= Altura/4, center=true);
            //     difference(){
            //         cylinder(r=Rtornillo, h= Altura/3, center=true);
            //     }
             }


        }

    }

}


module BaseSolida() {
    difference(){
        roundedcube_simple([Ancho, Largo, Altura/2],radius=8, center=true);
        SacabocadosBase();
//         translate([0,0,-Altura/4+1-2]) cube([Ancho*1.1, Largo*1.1,10], center=true);
//         translate([0,0,-Altura/4-2]) rotate([180,0,0]) scale(1.03) Tapa();
//         translate([0,0,-Altura/4-2]) rotate([180,0,0]) Tapa();
        
        InteriorBase();
        translate([0,0,-Altura/4]) PatasSoporte(1);
    }

    PatasSoporte();
    // for (x = [-Ancho/2+espesor+RSujetadores, Ancho/2-espesor-RSujetadores]){
    //     for (y = [-Largo/2+espesor+RSujetadores, Largo/2-espesor-RSujetadores]){

    //         translate([x,y,Altura/8]) {
    //             difference(){
    //                 cylinder(r=RSujetadores, h= Altura/4, center=true);
    //                 cylinder(r=Rtornillo, h= Altura/3, center=true);
    //             }
    //         }


    //     }

    // }
    

}
    
   
module Base(){
    difference(){
        BaseSolida();
     for (x = [-Ancho/2+espesor+RSujetadores, Ancho/2-espesor-RSujetadores]){
         for (y = [-Largo/2+espesor+RSujetadores, Largo/2-espesor-RSujetadores]){

             translate([x,y,Altura/8]) {
                     cylinder(r=Rtornillo, h= Altura/3, center=true);
                     translate([0,0,Altura/16+1])
                     cylinder(r=RSujetadores-1, h= Altura/8, center=true);
                     translate([0,0,Altura/16-2])
                     cylinder(r2=RSujetadores-1, r1=Rtornillo, h= Altura/16, center=true);
             }


         }

     }
    }
}
