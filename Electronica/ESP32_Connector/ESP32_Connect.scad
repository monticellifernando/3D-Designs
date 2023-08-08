$fn=15;

// Tamaño del PCB
Ancho = 18;
Alto = 25.5;
Profundidad=0.8;

// Tamaño de la cápsula
Ancho_c = 16.2; //15.8;
Alto_c = 18; //17.6;
Profundidad_c=2.3;
module ESP32(noozle = 0.4){


    margen = noozle;

    // Tamaño del PCB
    m_Ancho = Ancho +margen;
    m_Alto = Alto  + margen;
    m_Profundidad=Profundidad+margen;

    // Tamaño de la cápsula
    m_Ancho_c = Ancho_c +margen;
    m_Alto_c = Alto_c  + margen;
    m_Profundidad_c=Profundidad_c+margen;

    difference(){
        union(){
            cube([m_Ancho,m_Alto,m_Profundidad]);
            translate([(m_Ancho-m_Ancho_c)/2-margen/2,1.05-margen/2,0.79]) cube([m_Ancho_c,m_Alto_c,m_Profundidad_c]);
        };
        AgujerosPlaca(noozle,margen*2.1);
    }
}



module AgujerosPlaca(noozle=0.4, extralargo=0, Separacion=3){

    margen = noozle;
    radio=0.35;
    for ( i = [ 0 : 13 ]) {
        for (j = [ -Separacion, 0, 18, 18+Separacion ]){
            translate([j,i*1.27+margen+1.5,Profundidad/2]) 
                union(){
                    cylinder(r=radio+margen/2,h=Profundidad+extralargo,center=true);
                    if (j<0 || j>18){
                        rotate([0,90,0])cylinder(r=radio+margen/2,h=2*Separacion,center=true);

                    };
                }

        }
    }
    for ( i = [ 0: 11 ]) {
        for (j = [-Separacion, 0]){
            translate([i*1.27+(Ancho - 13.97)/2,j,Profundidad/2]) 
                union(){
                    cylinder(r=radio+margen/2,h=Profundidad+extralargo,center=true);
                    if (j<0) {
                        rotate([90,0,0])cylinder(r=radio+margen/2,h=2*Separacion,center=true);
                    }
                }

        }
    }
}

module PortaEsp32(noozle=0.4){
    ExtraLargo = 10;
    difference(){
        translate([-ExtraLargo/2,-ExtraLargo/2,0.2]) cube([Ancho+ExtraLargo,Alto+ExtraLargo, 3]);
            union(){
                ESP32(noozle);
                AgujerosPlaca(noozle+0.01,10,3 );
            };


    }



}




PortaEsp32(0.4);
//ESP32(0.1);
//AgujerosPlaca(0);


