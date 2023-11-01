$fn=50;

use<../../threads-scad/threads.scad>


// https://www.amazon.com/Scientific-Laboratory-Stainless-Platform-Lab-Lift/dp/B01M8LBBZM/ref=sr_1_6?keywords=lab+jack&qid=1698772545&sr=8-6
//
// 8 piecitas ovaladas
// 2 cilindros largos
// 1 base
// 1 tapa 
//

Size=80;
Depth=2;
Height=15;
HoleRadious=4;
SmallHoleRadious=2;
Separation=70;


module SolidBase(){
    difference(){
        cube([Size,Size,2*Depth],center=true);
        translate([0,0,Depth])cube([Separation,Size-Height/2,2*Depth],center=true);

        translate([5,-20,-1])linear_extrude(height = 2) {
              rotate([0,0,90])
                text("ZShman", font = "Inconsolata:Bold");
        }
    }
}

module BaseHolderLeft(){
    rotate([0,-90,0])
    {

        translate([(Height-Depth)/2,0,-Height/2-Depth+0.1]) rotate([0,0,90]) 
            cube([Size-4*Depth,Height,Depth],center=true);
        rotate([90,0,90]) 
            difference(){
                cube([Size-4*Depth,Height+Depth,Depth],center=true);
                translate([1*((Size-4*Depth)-Height)/2,0,0])
                    cylinder(h=Depth+1, r=HoleRadious,center=true);


                translate([-1*((Size-4*Depth)-Height)/2,0,0])
                    cylinder(h=Depth+1, r=HoleRadious,center=true);

                translate([0.5*((Size-4*Depth)-Height)/2,0,0])
                    cylinder(h=Depth+1, r=HoleRadious,center=true);

                translate([-0.25*((Size-4*Depth)-Height)/2,0,0])
                    cube([(Size+4*Depth)/2,HoleRadious*2,Depth+1],center=true);


                //        cube([Height,Size-Height-1, Depth], center=true);
            }
    }
}
module BaseHolderRight(){
   mirror([1,0,0]) BaseHolderLeft(); 

}


module Pituto(){
    difference(){
        union(){
            cylinder(h=Depth+1, r=HoleRadious,center=true);
            translate([0,0,(-Depth-2)/2]) cylinder(h=Depth,r=Height/2,center=true);
        }
        cylinder(h=10*Depth+2, r=SmallHoleRadious,center=true);
    }
}


module SolidSides(){

        cube([Size-4*Depth-Height,Height,Depth],center=true);
        for (i = [-1,1]){
            translate([i*((Size-4*Depth)-Height)/2,0,0]) cylinder(h=Depth,r=Height/2,center=true);
        }
}


module Sides(AdditionalLength=0){
    difference(){
        SolidSides();
        translate([1*((Size-4*Depth)-Height)/2,0,0])
            cylinder(h=Depth+1, r=HoleRadious,center=true);
        translate([-((Size-4*Depth)-Height)/2,0,0])
            cylinder(h=3*Depth, r=SmallHoleRadious,center=true);

        cylinder(h=Depth+1, r=SmallHoleRadious,center=true);
    }
    difference(){
        translate([-((Size-4*Depth)-Height)/2,0,1.25*Depth+AdditionalLength/2])
            cylinder(h=2.5*Depth+AdditionalLength, r=HoleRadious-0.5,center=true);
        translate([-((Size-4*Depth)-Height)/2,0,0])
            cylinder(h=10*Depth, r=SmallHoleRadious,center=true);
    }

}


module SidesMiddleHole(){

    difference(){
        Sides();
        cylinder(h=Depth+1, r=HoleRadious,center=true);
    }

}

module SidesMiddlePlug(){

        Sides(Depth);
            difference(){
                translate([0,0,1.25*Depth])
                    cylinder(h=2.5*Depth, r=HoleRadious-0.5,center=true);
                translate([0,0,0])
                    cylinder(h=10*Depth, r=SmallHoleRadious,center=true);
            }


}

module HoleTuerca(){


    m_R = 3;
    m_h = 3;

        cylinder(h=3, r=3.5/3*m_R,center=true, $fn=6);
        translate([1.25*3.5/3*m_R,0,0]) cube([8,2*m_R,m_h], center=true);
        cylinder(h=15, r=SmallHoleRadious,center=true);
}

module Tubes(){

    difference(){
        cube([Separation-4*Depth-2,2*HoleRadious,2*HoleRadious],center=true);
        rotate([0,90,0])
        cylinder(h=Size+1, r=SmallHoleRadious,center=true);
        rotate([90,90,0]) HoleTuerca();
        for (i = [-1, 1]){
            translate([i*(Separation-4*Depth-2-15)/2,0,0]) rotate([0,90,0]) HoleTuerca();
        }
    }
}

// // for (i=[-50,50]){
// //     translate([0,i,Height/2]) Base();
// // }
// for ( i = [ 1:4] ) {
//     translate([80,i*15 - 45,Depth/2]) SidesMiddlePlug();
// }
// 
// translate([-Separation/2+Depth,0,Height]) BaseHolderLeft();
// //for (i = [-10,10]){
// //    translate([i,0,Size/2]) tubes();
// //}
// SolidBase();
// 
// translate([90,40,0]) Pituto();
// //translate([90,-50,0]) HoleTuerca();
// translate([90,-50,0]) Tubes();
