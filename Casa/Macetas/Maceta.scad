$fn=50;

NroDeRayos=6;

EspesorParedes = 2;


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

module CuboHueco(Tamano=100,AjusteInterior=0){
    
    difference(){
        Cubo(Tamano);
        SacarInterior(Tamano,AjusteInterior);

    }
}

module Base(Tamano=100, AjusteInterior=0){
        CuboHueco(Tamano,AjusteInterior);
}

module SacarInterior(Tamano,AjusteInterior){
    AgujeroInterior=Tamano*89/100-AjusteInterior;
    // AgujeroInterior=Tamano-AjusteInterior;
        union(){
            // Sacar interior y sobrantes
            translate([0,0,0.5*Tamano+EspesorParedes])
                cube([AgujeroInterior,AgujeroInterior,Tamano], center=true);
            translate([0,0,(0.77)*Tamano])
                cube(Tamano*1.01, center=true);


        }
}


module Rejilla(Tamano=100){

    difference(){
        translate([0,0,0.83*Tamano]) cube([0.87*Tamano-0.5,0.86*Tamano-0.5, EspesorParedes],center=true);
        for (i=[0:NroDeRayos]){
            //for (j=[0, 0.15, 0.22, 0.30]){ //}
            for (j=[ 0.15, 0.3]){
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
   //     translate([0,0,Tamano*.3])
            cube([Tamano*.88-2*EspesorParedes,Tamano*.88-2*EspesorParedes,Tamano], center=true);
        Base(Tamano,1);
        translate([0,0,1.27*Tamano])
            cube([Tamano*.9-EspesorParedes,Tamano*.9-EspesorParedes,Tamano*2], center=true);
        // Quitar la mitad del encastre
        translate([0,0,Tamano/20])
            cube([Tamano,Tamano,Tamano/6], center=true);
    }



    //    translate([0,0,-80]) cube([
}
