$fn=50;

NroDeRayos=10;


module Cubo(Tamano=100){
    rotate([180,0,0])
        scale(4.2*Tamano/100) translate([-12.75,-12.75,-25])
        //import("Extra_Printable_Companion_Cube.STL", convexity=6);
        import("Weighted_Companion_Cube_33138.stl", convexity=6);
}

module CuboHueco(Tamano=100,AjusteInterior=0){
    
    difference(){
        Cubo(Tamano);
        SacarInterior(Tamano,AjusteInterior);

    }
}

module Base(Tamano=100, AjusteInterior=-1){
    difference(){
        CuboHueco(Tamano,AjusteInterior);
        SacarCilindros(Tamano);
    }
}

module SacarInterior(Tamano,AjusteInterior){
    AgujeroInterior=Tamano*86/100-AjusteInterior;
    rotate([180,0,0])
        union(){
            // Sacar interior y sobrantes
            translate([0,0,-45*Tamano/100])
                cube([AgujeroInterior,AgujeroInterior,Tamano], center=true);
            translate([0,0,-12*Tamano/100])
                cube(Tamano*1.1, center=true);


        }
}


module Rejilla(Tamano=100){

    difference(){
        translate([0,0,0.9*Tamano]) cube([0.82*Tamano-0.5,0.82*Tamano-0.5,2],center=true);
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
            cube([Tamano*.83-0.5,Tamano*.83-0.5,Tamano], center=true);
        Base(Tamano,0);
        translate([0,0,0.46*Tamano])
            cube([Tamano*.8,Tamano*.8,Tamano], center=true);
    }

    //    translate([0,0,-80]) cube([
}

