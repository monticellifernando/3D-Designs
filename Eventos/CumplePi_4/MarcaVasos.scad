$fn=50;


// cassette_keyring.stl
// MarcaVasos.scad


module Agarre(){
    difference(){
        translate([0,-42,3.5])
            rotate([0,90,0])
            import("Rectangle_3.8mm_5331357.stl");
        translate([-5,-5,-10])
            cube([50,35,10]);

    }
}

module Cassette(Escala=1){
    union(){
        scale([Escala*0.7,Escala*0.7,Escala*1.5])
            translate([0,-51,0])
            import("cassette_2.STL", convexity=6);

        scale([1,1,Escala])
        Agarre();
    }
        
}

module MarcaVasos(Texto="Test", Escala=0.75){


    difference(){
        union(){
            Cassette(Escala);

            translate([Escala*2, Escala*-11,Escala*5-0.2])
                linear_extrude(height = 1.5) {
                    scale([Escala*0.75,Escala*0.75,Escala*1])
                        text(Texto, font = ":Bold");
                }
        }


        translate([Escala*55, Escala*-11,Escala-1])
            linear_extrude(height = 1.5) {
                mirror([1,0,0]) scale([Escala*0.75,Escala*0.75,Escala*1])
                    text("Fer π/4 ", font = ":Bold");
            }
        translate([Escala*45, Escala*-30,Escala-1])
            linear_extrude(height = 1.5) {
                mirror([1,0,0]) scale([Escala*0.75,Escala*0.75,Escala*1])
                    text("2024 ", font = ":Bold");
            }


    }
}

//MarcaVasos("Monticelli",0.75);

