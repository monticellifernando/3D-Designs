$fn=50;

NroDeRayos=10;


module Cubo(Tamano=100){
//    rotate([180,0,0])
        //scale(4.2*Tamano/100) //translate([-12.75,-12.75,-25])
//        translate([35,-20,0])
        //import("Extra_Printable_Companion_Cube.STL", convexity=6);
        scale(Tamano/16)
        import("question_basic.stl", convexity=6);
}

module CuboHueco(Tamano=100,AjusteInterior=0){
    
    difference(){
        Cubo(Tamano);
        SacarInterior(Tamano,AjusteInterior);

    }
}

module Base(Tamano=100, AjusteInterior=-1){
        CuboHueco(Tamano,AjusteInterior);
}

module SacarInterior(Tamano,AjusteInterior){
    AgujeroInterior=Tamano*85/100-AjusteInterior;
        union(){
            // Sacar interior y sobrantes
            translate([0,0,0.6*Tamano])
                cube([AgujeroInterior,AgujeroInterior,Tamano], center=true);
            translate([0,0,(0.75)*Tamano])
                cube(Tamano*1.01, center=true);


        }
}


module Rejilla(Tamano=100){

    difference(){
        translate([0,0,0.83*Tamano]) cube([0.83*Tamano-0.5,0.83*Tamano-0.5,2],center=true);
        for (i=[0:NroDeRayos]){
            for (j=[0, 0.15, 0.22, 0.30]){
                rotate([0,0,360*i/NroDeRayos]) 
                    translate([Tamano*j,0,Tamano*.9]) 
                    cylinder(r=2, h=50,center=true);
            }
        }
    }
}


module SacarCilindros(Tamano=100){
    translate([0,0,52.5*Tamano/100])    rotate([0,90,0]) cylinder(r=Tamano*34/100,h=Tamano*1.1,center=true);
    translate([0,0,52.5*Tamano/100])    rotate([90,0,0]) cylinder(r=Tamano*34/100,h=Tamano*1.1,center=true);
}

module Maceta(Tamano=100){
    difference(){
        Cubo(Tamano);
        translate([0,0,Tamano*.43])
            cube([Tamano*.85-5,Tamano*.85-5,Tamano], center=true);
        Base(Tamano,1);
        translate([0,0,1.25*Tamano])
            cube([Tamano*.85,Tamano*.85,Tamano*2], center=true);
    }

    //    translate([0,0,-80]) cube([
}


// Modelo
// translate([0,0,-5]) Base();
//  Maceta();
// 
// translate([0,0,-50]) color ([0.8,0.2,0], alpha=0.7) Rejilla();


// Partes

// Cubo();
//    CuboHueco();
//SacarInterior();
//
//
// color([0.8,0.2,0], alpha=0.7)
//     Maceta(50);
    // // 
// color([0.8,1,0.9], alpha=0.7)
//     Rejilla(50);

//    color([0,0.8,0.9], alpha=0.9)
//       Base(50);

