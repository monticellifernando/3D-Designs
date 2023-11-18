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
BaseDepth=2;
Depth=7.5;
Height=15;
HoleRadious=4;
SmallHoleRadious=2.1;
//Separation=70;
Separation=Size-2*Depth;

SideLength = Size-2*Depth;

module SolidBase(){
    difference(){
        cube([Size,Size,2*BaseDepth],center=true);
        //translate([0,0,BaseDepth])cube([2*Separation,Size-Height/2,2*BaseDepth],center=true);
        translate([0,0,BaseDepth])cube([Size+1,Size+1,2*BaseDepth],center=true);

        translate([5,-20,-1])linear_extrude(height = 2) {
              rotate([0,0,90])
                text("ZShman", font = "Inconsolata:Bold");
        }
    }
}



module BaseHolderLeft(){
    rotate([0,-90,0])
    {

        translate([(Height-Depth)/2,0,-Height/2-BaseDepth+0.1]) rotate([0,0,90]) 
            cube([Size-4*BaseDepth-0.2,Height,Depth],center=true);
        rotate([90,0,90]) 
            difference(){
                cube([Size-4*BaseDepth-0.2,Height+BaseDepth,Depth],center=true);
                translate([1*((Size-4*BaseDepth)-Height)/2,0,0])
                    cylinder(h=Depth+1, r=HoleRadious,center=true);


                translate([-1*((Size-4*BaseDepth)-Height)/2,0,0])
                    cylinder(h=Depth+1, r=HoleRadious,center=true);

                translate([0.25*((Size-4*BaseDepth)-Height)/2,0,0])
                    cylinder(h=Depth+1, r=1*HoleRadious,center=true);

                translate([-0.25*((Size))+Height/2+HoleRadious/2,0,0])
                    cube([0.5*(Size)-HoleRadious,HoleRadious*2,Depth+1],center=true);


                //        cube([Height,Size-Height-1, Depth], center=true);
            }
    }
}
module BaseHolderHole(){
    //rotate([0,0,-90])
    {

        translate([(Height-Depth)/2,0,-Height/2-Depth/2+0.1]) rotate([0,0,90]) 
            cube([Height,Height,Depth],center=true);
        rotate([90,0,90]) 
            difference(){
                cube([Height,Height+BaseDepth,Depth],center=true);
                // translate([1*((Size-4*BaseDepth)-Height)/2,0,0])
                //     cylinder(h=Depth+1, r=HoleRadious,center=true);



                    cylinder(h=Depth+1, r=1*HoleRadious,center=true);

                //cube([0.66*(0.75*Size)-HoleRadious,HoleRadious*2,Depth+1],center=true);


                //        cube([Height,Size-Height-1, Depth], center=true);
            }
    }

}

module BaseHolderWide(){
    //rotate([0,-90,0])
    {

        translate([(Height-Depth)/2,0,-Height/2-Depth/2+0.1]) rotate([0,0,90]) 
            cube([0.75*Size-4*BaseDepth-0.2,Height,Depth],center=true);
        rotate([90,0,90]) 
            difference(){
                cube([0.75*Size-4*BaseDepth-0.2,Height+BaseDepth,Depth],center=true);
                // translate([1*((Size-4*BaseDepth)-Height)/2,0,0])
                //     cylinder(h=Depth+1, r=HoleRadious,center=true);


                translate([-1*((0.75*Size-4*BaseDepth)-Height)/2,0,0])
                    cylinder(h=Depth+1, r=HoleRadious,center=true);

                translate([0.66*((Size-4*BaseDepth)-Height)/2,0,0])
                    cylinder(h=Depth+1, r=1*HoleRadious,center=true);

                cube([0.66*(0.75*Size)-HoleRadious,HoleRadious*2,Depth+1],center=true);


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
            cylinder(h=Depth+0.4+ExtraLength, r=HoleRadious-0.5,center=true);
            translate([0,0,(-Depth-2-ExtraLength)/2]) cylinder(h=BaseDepth,r=Height/2,center=true);
        }
        cylinder(h=10*Depth+2, r=InternalRadious,center=true);
    }
}

module PitutoLargo(){
    Pituto(Depth+0.5);
}

module PitutoAngosto(){
    Pituto(0,SmallHoleRadious-0.3);
}


module Cup(){
    translate([0,0,(-Depth-BaseDepth)/2]) cylinder(h=BaseDepth,r=Height/2,center=true);
    cylinder(h=Depth, r=SmallHoleRadious-0.3,center=true);
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


        cube([SideLength,Height,Depth],center=true);
        for (i = [-1,1]){
            translate([i*(SideLength)/2,0,0]) cylinder(h=Depth,r=Height/2,center=true);
        }
}


module Sides(AdditionalLength=0){
    difference(){
        SolidSides();
        translate([1*SideLength/2,0,0])
            cylinder(h=Depth+1, r=HoleRadious,center=true);
        translate([-SideLength/2,0,0])
            cylinder(h=3*Depth, r=SmallHoleRadious,center=true);

        cylinder(h=Depth+1, r=SmallHoleRadious,center=true);
    }
    difference(){
        translate([-SideLength/2,0,1.1*Depth+AdditionalLength/2])
            cylinder(h=1.2*Depth+AdditionalLength, r=HoleRadious-0.5,center=true);
        translate([-SideLength/2,0,0])
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
                translate([0,0,Depth-0.1])
                    cylinder(h=Depth, r=HoleRadious-0.5,center=true);
                translate([0,0,0])
                    cylinder(h=10*Depth, r=SmallHoleRadious,center=true);
            }


}

module Tuerca(R=4.15, h=3.6){


    m_R = R;
    m_h = h;

        cylinder(h=m_h, r=3.5/3*m_R,center=true, $fn=6);
        translate([1.25*3.5/3*m_R,0,0]) cube([8,2*m_R,m_h], center=true);
}
module HoleTuerca(R=4.15, h=3.6){


    m_R = R;
    m_h = h;

        Tuerca(R=m_R, h=m_h);
        cylinder(h=15, r=SmallHoleRadious,center=true);
}

module Cone(){
    Radious = 2.75*HoleRadious/2;

    difference(){
        cylinder(h=Height/2, r1=Radious, r2=SmallHoleRadious, center=true);
        cylinder(h=Height/2+1, r=SmallHoleRadious, center=true);

    }

}

module Tubes(){
   TubeLength=Separation-4*Depth;

    Translation=(2.75*HoleRadious/2)+(Height/2)/2-0.01;

    translate([0,Translation,0])
    rotate([-90,0]) Cone();

    difference(){
        cube([TubeLength,2.75*HoleRadious,2.75*HoleRadious],center=true);
        rotate([90,90,0]) HoleTuerca();
        for (i = [-1, 1]){
            translate([i*(Separation-4*Depth-2-5)/2,0,0]) 
                union(){
                rotate([0,90,0]) Tuerca();
                rotate([0,90,0]) cylinder(h=Separation/2.4, r=SmallHoleRadious,center=true);
                }
        }
    }
}

