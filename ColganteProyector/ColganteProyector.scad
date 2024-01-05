$fn=50;
use <roundedcube_simple.scad>



module SoporteTraseroProyector(RadioAgujero=3, Altura=15){

    // Este es el soporte que se atornilla Al proyector con M5
    // En esta pieza encastra el SoporteTRaseroTecho que va atornillado Con Tarugos al Techo
    //


    difference(){
        translate([-1,0,0])
        cube([17,20,Altura],center=true);
        rotate([0,25,0])
         translate([10 ,0,0])
             cube([20,21,Altura-8],center=true);
        translate([7,0,0])
            cube([20,21,Altura-8],center=true);
        cylinder(r=RadioAgujero,h=2*Altura,center=true);
        translate([0,0,-4])
            cylinder(r=5.2,h=Altura+0.5,center=true);
        translate([0,0,Altura/2-3.1])
            cylinder(r1=5.2,r2=RadioAgujero,h=2,center=true);
    }

}


module SoporteTraseroTecho(Altura=20){
     


    scale(1.05)
    difference(){
        translate([-2,0,0])
            cube([17,30,Altura-0.1],center=true);
        //translate([1.1,0,0])
        cube([15,20,Altura],center=true);
    }
    translate([-1,0,0])
    scale(1.05) SoporteTraseroProyector(3,Altura);

}



module SoporteDelanteroTecho(Altura=35){


    difference(){
        SoporteTraseroTecho(Altura);
        translate([0,0,-0])
        cylinder(r=9.5,h=Altura-8,center=true);
        translate([15,0,0.65*(Altura+4)] )rotate([0,-10,0]) cube([55,55,10],center=true);

    }


}


//SoporteDelanteroTecho();
// rotate([180,0,180])
// translate([-5,0,5]) 
//SoporteTraseroProyector();
//SoporteTraseroTecho();

    
   
//translate([2,0,-5]) rotate([0,0,180]) SoporteTraseroTecho();
