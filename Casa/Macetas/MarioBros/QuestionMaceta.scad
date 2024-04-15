include <../Maceta.scad>


module Cubo(Tamano=100){
//    rotate([180,0,0])
        //scale(4.2*Tamano/100) //translate([-12.75,-12.75,-25])
//        translate([35,-20,0])
        //import("Extra_Printable_Companion_Cube.STL", convexity=6);
        scale(Tamano/16)
        import("question_basic.stl", convexity=6);
        TamanoCubo = Tamano*0.91;
        translate([0,0,TamanoCubo/2.07])
        cube([TamanoCubo,TamanoCubo,TamanoCubo*0.9625], center=true);
}

