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
SmallHoleRadious=2.1;
Separation=70;


module SolidBase(){
    difference(){
        cube([Size,Size,2*Depth],center=true);
        translate([0,0,Depth])cube([2*Separation,Size-Height/2,2*Depth],center=true);

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

                translate([0.25*((Size-4*Depth)-Height)/2,0,0])
                    cylinder(h=Depth+1, r=HoleRadious,center=true);

                translate([-0.35*((Size-4*Depth)-Height)/2,0,0])
                    cube([0.82*(Size+4*Depth)/2,HoleRadious*2,Depth+1],center=true);


                //        cube([Height,Size-Height-1, Depth], center=true);
            }
    }
}
module BaseHolderRight(){
   mirror([1,0,0]) BaseHolderLeft(); 

}


module Pituto(ExtraLength=0, InternalRadious=SmallHoleRadious){
    difference(){
        union(){
            cylinder(h=Depth+1+ExtraLength, r=HoleRadious-0.5,center=true);
            translate([0,0,(-Depth-2-ExtraLength)/2]) cylinder(h=Depth,r=Height/2,center=true);
        }
        cylinder(h=10*Depth+2, r=InternalRadious,center=true);
    }
}

module PitutoLargo(){
    Pituto(3);
}

module PitutoAngosto(){
    Pituto(0,SmallHoleRadious-0.3);
}


module Cup(){
    translate([0,0,(-Depth-2)/2]) cylinder(h=Depth,r=Height/2,center=true);
    cylinder(h=2*Depth+2, r=SmallHoleRadious-0.3,center=true);
}

module SmallCup(){
    difference(){
        Cup();
        for (i = [-1,1]){
            translate([i*(SmallHoleRadious+Height/2),0,0]) cube([Height,Height,Height], center=true);
        }
    }
}


module Perilla(){
    difference(){
        union(){
            Pituto();
            translate([0,0,-Depth-5]) cylinder(h=10,r=20,$fn=8,center=true);
            translate([0,0,-Depth-5]) rotate([0,0,360/16]) cylinder(h=10,r=20,$fn=8,center=true);
        }
            cylinder(h=10*Depth+2, r=SmallHoleRadious,center=true);
            translate([0,0,-Depth-8.5])  cylinder(h=4,r=4.75,$fn=6,center=true);

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
        translate([-((Size-4*Depth)-Height)/2,0,1.1*Depth+AdditionalLength/2])
            cylinder(h=1.2*Depth+AdditionalLength, r=HoleRadious-0.5,center=true);
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
                translate([0,0,1.1*Depth])
                    cylinder(h=1.2*Depth, r=HoleRadious-0.5,center=true);
                translate([0,0,0])
                    cylinder(h=10*Depth, r=SmallHoleRadious,center=true);
            }


}

module HoleTuerca(R=4.15, h=3.6){


    m_R = R;
    m_h = h;

        cylinder(h=m_h, r=3.5/3*m_R,center=true, $fn=6);
        translate([1.25*3.5/3*m_R,0,0]) cube([8,2*m_R,m_h], center=true);
        cylinder(h=15, r=SmallHoleRadious,center=true);
}

module Cone(){
    Radious = 2.75*HoleRadious/2;

    difference(){
        cylinder(h=Radious+Depth, r1=Radious, r2=Depth, center=true);
        cylinder(h=Radious+Depth+1, r=SmallHoleRadious, center=true);

    }

}

module Tubes(){

    Translation=(2.75*HoleRadious/2)+(2.75*HoleRadious/2+Depth)/2-0.01;

    translate([0,Translation,0])
    rotate([-90,0]) Cone();

    difference(){
        cube([Separation-4*Depth-2,2.75*HoleRadious,2.75*HoleRadious],center=true);
        rotate([90,90,0]) HoleTuerca();
        for (i = [-1, 1]){
            translate([i*(Separation-4*Depth-2-15)/2,0,0]) 
                union(){
                rotate([0,90,0]) HoleTuerca();
                rotate([0,90,0]) cylinder(h=Size/2.4, r=SmallHoleRadious,center=true);
                }
        }
    }
}

