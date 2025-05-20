$fn=40;
use <roundedcube_simple.scad>

// Propiedades del chasis
espesor=1.6;

Ancho  = 80; 
Largo  = 100; 
Altura =  65; 

// Cada cuanto hay una barra horizontal en el chasis
paso = Largo/39;

RSujetadores = 7;
Rtornillo = 3;

// Propiedades de Soportes/agarres ADENTRO del chasis para el trafo y la fuente
DiametroAgarres = 2.5;
AltoAgarres = 5+espesor;

DistanciaPatasTrafo = 62.5;
LargoTrafo = 50;

AnchoFuente = 57; // Distancia entre agujeros de la fuente en X
LargoFuente = 25; // Distancia entre agujeros de la fuente en Y 



module Logo(){
    translate([-Ancho/2+20,18,Altura/2-9.4]){

        //import("Logo/C64_READY.stl", convexity=100);
        scale([1,1,5]){
            import("Logo/C64.stl", convexity=100);
            import("Logo/READY.stl", convexity=11);
            //import("Logo/R.stl", convexity=100);
            //import("Logo/E.stl", convexity=100);
        }
    }
}

module Interlock(){

    m_espesor = 50;

    m_margen = 0.5;

    m_ancho = 28;
    m_ancho_arriba = 16;
    m_largo_trapecio = 8;
    m_largo = 41;
    m_distancia_agujeros = 40;
    m_diametro_agujeros = 5;

    //cube([m_ancho+0.5, m_largo +0.5, m_espesor+1], center = true);

    // Uso un poligono
    poly = [
        [-m_ancho/2, -m_largo/2],
        [-m_ancho/2, m_largo/2],
        [- m_ancho_arriba/2, m_largo/2 + m_largo_trapecio],
        [+ m_ancho_arriba/2, m_largo/2 + m_largo_trapecio],
        [+m_ancho/2, +m_largo/2],
        [+m_ancho/2, -m_largo/2]

    ];

        translate([0,0,-m_espesor/2])

            linear_extrude(height=m_espesor)
            minkowski() {
                polygon(points = poly);    
                circle(m_margen/2);
            }

 for (i = [-m_distancia_agujeros/2, m_distancia_agujeros/2]){

     translate([i, 4.5 ,0])
         cylinder(d=m_diametro_agujeros,h=m_espesor,center=true);
 }


}

module MuecaTuerca(){

    m_Largo = Largo/2-espesor-RSujetadores;
    m_Ancho = Ancho/2-espesor-RSujetadores;
    translate([sqrt(m_Ancho*m_Ancho+m_Largo*m_Largo),0,-Altura/2+20])
    rotate([0,0,180]){
        cylinder(r=5, h=4, center=true, $fn=6);
        translate([5,0,0]) cylinder(r=5, h=4, center=true, $fn=6);
    }
}

module InteriorTapa(){
    translate([0,0,-espesor]){
        difference(){
            roundedcube_simple([Ancho-2*espesor,Largo-2*espesor,Altura],radius=8, center=true);
            for (x = [-Ancho/2+espesor/2+RSujetadores, Ancho/2-espesor/2-RSujetadores]){
                for (y = [-Largo/2+espesor/2+RSujetadores, Largo/2-espesor/2-RSujetadores]){

                    m_Angle = 15;

                    //if ( x > 0 && y > 0 ) {}

                    Anglex = - y/ abs(y) * m_Angle ;
                    Angley =  x/ abs(x) * m_Angle ;

                    translate([x+Altura/4*sin(Angley),y-Altura/4*sin(Anglex),0])           rotate([Anglex, Angley ,0]) cylinder(r=RSujetadores-1.5, h= Altura, center=true);
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

module CuadradoLogo(m_alt=espesor, tolerancia=0){
    cube([19*paso-tolerancia,19*paso-tolerancia,m_alt], center=true);
}

module C64Chasis(){
    union(){
        // Cuadrado para mostrar el logo
        //translate([0,-2*espesor,Altura/2+espesor/2-0.5])
        //    CuadradoLogo();
        roundedcube_simple([Ancho, Largo, Altura],radius=8, center=true);
        for ( i = [0:1:Largo/(2*paso)]){
            translate([0,-Largo/2+paso/2+(2*i)*paso,espesor/2])
                cube([Ancho, paso, Altura+espesor/2-0.1], center=true);
        }

    }
}

module Tapa(){
    difference(){
        C64Chasis();


        // Saco un poco del cuadrado del logo
        translate([0,paso,Altura/2-4])
        CuadradoLogo(15);
        
        // Hueco
        InteriorTapa();

        //Logo
        //Logo();
        
        // Muecas para tuercas
        for ( x = [90,-90]){
            m_Largo = Largo/2-espesor-RSujetadores/2;
            m_Ancho = Ancho/2-espesor-RSujetadores/2;

            for (angle = [atan(m_Ancho/m_Largo), atan(-m_Ancho/m_Largo)]){
                    rotate([0,0,angle+x]) MuecaTuerca();
                    }
        }

        // // Agujero palanca
        // translate([15,0,Altura/2 - 2*espesor]) AgujeroPalanca();
        // 
        // // Agujero Boton
        // translate([-30,Largo/4,Altura/2 - 2*espesor]) AgujeroBoton();

        // Agujero Cable
        translate([0, Largo/2, -Altura/4]) rotate([90,0,0]) cylinder(r=4, h= 4*espesor, center=true);
        translate([0, Largo/2, -Altura/2])  cube([8, 4*espesor, Altura/2], center=true);

        // Interlock
        translate([4,-Largo/2,0])
            rotate([90,-90,0])
            Interlock();
    }
}


module InteriorBase(){
    translate([0,0,-Altura/4-espesor]){
            roundedcube_simple([Ancho-3*espesor,Largo-3*espesor,Altura],radius=8, center=true);
    }
}

module SacabocadosBase(){
    translate([0,0,-10])
    difference(){
        cube([Ancho*1.1, Largo*1.1, 20],center=true);
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
    

}
    

module AgarresTrafoYFuente(){


    for (i = [-DistanciaPatasTrafo/2,DistanciaPatasTrafo/2]){

        translate([i,+Largo/2-LargoTrafo/2,Altura/4-AltoAgarres/2-espesor])
            cylinder(d1=0.75*DiametroAgarres, d2=1.5*DiametroAgarres, h = AltoAgarres, center = true);
    }


    for (x = [-AnchoFuente/2,AnchoFuente/2]){
        for (y = [-LargoFuente/2,LargoFuente/2]){

            translate([x,-Largo/2+LargoFuente/2+25+y,Altura/4-AltoAgarres/2-espesor])
                cylinder(d1=0.75*DiametroAgarres, d2=1.5*DiametroAgarres, h = AltoAgarres, center = true);
        }
    }



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
     // Agujero del Tornillo del interlock
     translate([0,-Largo/2,-5])
         rotate([ 90,0,0])
         cylinder(r=5, h=5, center=true, $fn=6);

    }

    // Agarres  para el trafo y la fuente
    AgarresTrafoYFuente();
    
}

module LogoChasis(){
    difference(){
        union(){
            CuadradoLogo(5, 0.8);
            translate([0,0,-2])
                rotate([0,0,45])
                cylinder(d2=(19*paso-0.6)*sqrt(2), d1=(19*paso-0.6)*sqrt(2)+5, h=2.5,center=true, $fn=4);
//            CuadradoLogo(1.2, -2);
        }
        translate([0,3,-31.4])
            Logo();
            translate([0,0,-2.5])
                rotate([0,0,45])
                cylinder(d2=(19*paso-0.6)*sqrt(2)-7, d1=(19*paso-0.6)*sqrt(2)+5, h=3,center=true, $fn=4);
    }
    // translate([0,3,-31.4])
    //     Logo();

}
