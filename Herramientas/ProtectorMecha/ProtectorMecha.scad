$fn=50;


module Base(diametro, texto=""){

    // Un agujero central de 1.5mm
    difference(){
        cylinder(h=15,r=diametro/2, $fn=6);

        for ( i = [ 0: 5] ){
            rotate([0,0,i*360/6])
                translate([0,diametro/2-2,0])
                Texto(texto);

        }
        translate([0,0,12])
        Mecha();
    }

}

module Texto(texto){
    scale(0.75)
    translate([-5,1, 20])
        rotate([90,90,0])
        linear_extrude(height = 2) {
            text(texto, font = ":Bold");
        }
}

module Mecha(){

    cylinder(r=(3.75+0.4)/2, h=7, center=true);
    translate([0,0,-3.5-2+0.1])
        cylinder(r2=(3.75+0.4)/2, r1=1, h=4,center=true);
    cylinder(r=1, h=30, center=true);

}

//Mecha();
//Base(20, "0.3");
//Texto("0.3");

//        translate([20,0,12])
//        Mecha();
