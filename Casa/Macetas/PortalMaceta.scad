$fn=50;

NroDeRayos=10;


module Cubo(){
    rotate([180,0,0])
        scale(4.2) translate([-12.75,-12.75,-25])
        //import("Extra_Printable_Companion_Cube.STL", convexity=6);
        import("Weighted_Companion_Cube_33138.stl", convexity=6);
}

module CuboHueco(AgujeroInterior=86){
    difference(){
        Cubo();
        SacarInterior(AgujeroInterior);

    }
}

module Base(AgujeroInterior=86){
    difference(){
        CuboHueco(AgujeroInterior);
        SacarCilindros();
    }
}

module SacarInterior(AgujeroInterior=86){
    rotate([180,0,0])
        union(){
            // Sacar interior y sobrantes
            translate([0,0,-45])
                cube([AgujeroInterior,AgujeroInterior,100], center=true);
            translate([0,0,-12])
                cube(110, center=true);


        }
}


module Rejilla(){

    difference(){
        translate([0,0,90]) cube([81.5,81.5,2],center=true);
        for (i=[0:NroDeRayos]){
            for (j=[0, 15, 22.5, 30]){
                rotate([0,0,360*i/NroDeRayos]) 
                    translate([j,0,90]) 
                    cylinder(r=2, h=50,center=true);
            }
        }
    }
}


module SacarCilindros(){
    translate([0,0,52.5])    rotate([0,90,0]) cylinder(r=34,h=110,center=true);
    translate([0,0,52.5])    rotate([90,0,0]) cylinder(r=34,h=110,center=true);
}

module Maceta(){
    difference(){
        Cubo();
        translate([0,0,43])
            cube([83,83,100], center=true);
        Base(85);
        translate([0,0,46])
            cube([80,80,100], center=true);
    }

    //    translate([0,0,-80]) cube([
}

//Base();
//    CuboHueco();
//SacarInterior();
//
//
//   color([0.8,0.9,1], alpha=0.7)
//   Maceta();
// // // 
//  color([0.8,1,0.9], alpha=0.7)
//  Rejilla();

//color([1,0.8,0.9], alpha=0.7)
//    Base();

