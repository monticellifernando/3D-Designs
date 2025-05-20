$fn=40;
use <roundedcube_simple.scad>

// Propiedades del chasis






m_espesor = 29;

m_margen = 3;

m_ancho = 120; // 
m_ancho_arriba = 16;
m_largo_trapecio = 8;
m_largo_atras = 65;
m_largo_adelante = -30;

EspesorMonitor=69.5;
AltoMonitor = 555;
AnchoMonitor = 952;
BaseMonitor = 15;

MonTranslate = [0,AltoMonitor/2-m_largo_atras/2+10,-5];


module PataSolida(){
    // Uso un poligono
    poly = [
        [-m_ancho/2, -m_largo_atras/2],
        [-m_ancho/2, m_largo_atras/2],
        [0, m_largo_atras/2 ],
        //[+ m_ancho_arriba, m_largo_adelante/2 ],
        //    [+ m_ancho_arriba/2, m_largo/2 + m_largo_trapecio],
        //    [+m_ancho/2, +m_largo/2],
        [+m_ancho/2, -m_largo_atras/2]

    ];

rotate([0,-90,0])
        linear_extrude(height=m_espesor)
            minkowski() {
              polygon(points = poly);    
                circle(m_margen);
           }

}

module Pata(){
    difference(){
        PataSolida();

        translate(MonTranslate)
            rotate([-0.5,0,0])
            MonitorBulk();
    }
}


module MonitorBulk(){
    cube([AnchoMonitor, AltoMonitor, EspesorMonitor], center=true);
}

module Pantalla(){
    translate([0,BaseMonitor,EspesorMonitor-5])
        cube([AnchoMonitor+1, AltoMonitor-BaseMonitor/2, EspesorMonitor], center=true);
}

module Monitor(){
    difference(){
        MonitorBulk();
        Pantalla();
    }
}



//      translate(MonTranslate)
//          rotate([-0.5,0,0])
//     scale(0.995)
//          Monitor();
    Pata();
