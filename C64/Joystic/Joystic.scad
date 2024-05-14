$fn=50;
use <roundedcube_simple.scad>

espesor=2;

Ancho  = 100; 
Largo  = 110; 
Altura =  40; 

RSujetadores = 6;
Rtornillo = 2;


module AgujeroBoton(){
    cylinder(h=2*espesor, r=12);
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
            roundedcube_simple([100-espesor,110-espesor,40],radius=8, center=true);
            for (x = [-Ancho/2+espesor+RSujetadores, Ancho/2-espesor-RSujetadores]){
                for (y = [-Largo/2+espesor+RSujetadores, Largo/2-espesor-RSujetadores]){

                    translate([x,y,0]) cylinder(r=RSujetadores, h= Altura, center=true);
                    translate([x*1.03,y*1.03,0]) cylinder(r=RSujetadores, h= Altura, center=true);


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

    }
}



    
    
