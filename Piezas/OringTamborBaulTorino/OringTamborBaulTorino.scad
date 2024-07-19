$fn=64;

r1 = 1.5;
a = 1;
b = 0.75;
r2 = a/2;

DIntToroide = 24;


module ToroidePrincipal(){

    rotate_extrude(convexity = 10, $fn=64)
        translate([DIntToroide/2, 0, 0])
        circle(r = r1);

}
module Labio(){


    translate([0,0,-r1/2-0.75])
    difference(){

        rotate_extrude(convexity = 10, $fn=64)
            translate([DIntToroide/2-r1, 0, 0])
            square([r1,r1]);

         rotate_extrude(convexity = 10, $fn=64)
             translate([DIntToroide/2+0.5, 0, 0])
             circle(r = r1);
    }
}

module Base(){

    translate([0,0,-r1/2-0.5])
//        difference(){

            cylinder(r=2*DIntToroide/2, h = r1/2+1, center=true);
//            cylinder(r=DIntToroide/2, h = r1/2+1.1, center=true);
//        }

}


module Asiento(){

    translate([0,0,r1/2])
    cylinder(r=DIntToroide/2, h = r1/2+0.5, center=true);

}




module Aro(Tamano=100){

    difference(){
        ToroidePrincipal();
        Asiento();
        Base();
    }
        Labio();
}


Aro();
//Labio();
