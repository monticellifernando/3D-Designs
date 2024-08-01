$fn=64;

r1 = 1.75;
a = 1;
b = 0.75;
r2 = a/2;

DIntToroide = 24.5;


module ToroidePrincipal(){

    rotate_extrude(convexity = 10, $fn=64)
        translate([DIntToroide/2, 0, 0])
        circle(r = r1);

}
module Labio(){


    translate([0,0,-r1/2-0.75])
    difference(){

        union(){
            rotate_extrude(convexity = 10, $fn=64)
                translate([DIntToroide/2-r1, 0, 0])
                square([r1,r1]);

            for ( i = [-1,1]){
                width= 0.8;
                translate([0,i*(DIntToroide/2-r1-width/2),-0.7-(-r1/2-0.75)])
                    cube([8,width,1.8],center=true);
            }
        }

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




module Oring(){

    difference(){
        ToroidePrincipal();
        Asiento();
        Base();
    }
        Labio();
}


module Aro(){
    difference(){

        Oring();
        translate([-DIntToroide/2+r1+0.25,0,0])
            cube([1,3.5,15],center=true);
    }


}



Aro();
//Labio();
