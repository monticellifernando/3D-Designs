include<LabJack.scad>
module ShowAll(){
    // for (i=[-50,50]){
    //     translate([0,i,Height/2]) Base();
    // }
    for ( i = [ 1:2] ) {
        translate([80,i*15 - 45,Depth/2]) SidesMiddlePlug();
    }
    for ( i = [ 3:4] ) {
        translate([80,i*15 - 45,Depth/2]) SidesMiddleHole();
    }

    translate([-Separation/2+Depth,0,Height]) BaseHolderLeft();
    //for (i = [-10,10]){
    //    translate([i,0,Size/2]) tubes();
    //}
    SolidBase();

    translate([100,40,0]) Pituto();
    translate([85,40,0]) PitutoLargo();
    translate([85,60,0]) PitutoAngosto();
    translate([70,40,0]) Cup();
    translate([70,60,0]) SmallCup();
    translate([50,40,0]) HoleTuerca();
    translate([130,40,0]) Perilla();
    translate([90,-50,0]) Tubes();
}


module PairOfSides(SideAngle, ZInverted){
    SideZDisplace=Depth+Height/2+(SideLength-(Height-2*(HoleRadious)))/2*sin(SideAngle);

    SideYDisplace=-(SideLength-Size)/2-(Height/2-HoleRadious);
    translate([0,SideYDisplace ,SideZDisplace])
        rotate([-90,SideAngle+(1-ZInverted)*180,-90]) 
        rotate([0,0,ZInverted])
        SidesMiddleHole();

    translate([-Depth*2*(1/2-ZInverted),SideYDisplace ,SideZDisplace])
        rotate([90,SideAngle+(1-ZInverted)*180,90]) 
        mirror([0,0,ZInverted])
        SidesMiddlePlug();
}

module SidesComplete(SideAngle){

    for (ZOffset = [0,1]){ 

        ZDisplacement = 2.55*ZOffset*(sin(SideAngle)*(SideLength));

        SideXDisplace = Size/2-(1.5+ZOffset)*Depth;

        for (x = [0,1]){
            i=2*(x-1/2);


//            mirror([0,ZOffset,0])
            translate([-i*SideXDisplace,0,ZDisplacement])
                //rotate([0,180*(i+1)/2,180*ZOffset])
                mirror([0,0,ZOffset])
                mirror([(i+1)/2-ZOffset,0,0])
            //mirror([0,0,ZOffset])
                PairOfSides(SideAngle, 0);
        }
    }




}



module Model(){
    SideAngle=45;
    // //    SolidBase();
    //      BaseHolderWide();
    //      translate([0,2*Depth,10 ])
    //     // BaseHolderLeft();
    //      BaseHolderHole();
    color([0.6,0.4,0.1], alpha=0.8)
    BaseDown();



 //     translate([0,-Height+SmallHoleRadious,Height+SideLength*sin(SideAngle)])
 //         rotate([180,0,0])
 //         Tubes();
 
     translate([-Size/2+2*Depth,-Height+SmallHoleRadious-0.5,Height+SideLength*sin(SideAngle)-0.5-Depth+BaseDepth/2 ])
         rotate([90,0,90])
         PitutoLargo();
 
     // translate([Size/2,0,2* Height])
     //     rotate([0,-90,0]) SmallCup();
     // translate([Size/2,Height,2* Height])
     //     rotate([0,-90,0]) Cup();
 
 

    for ( i = [-Height+SmallHoleRadious-0.5, -Height+SmallHoleRadious-0.5+SideLength*sin(SideAngle) ]) { 
     translate([0,i,Height+SideLength*sin(SideAngle)-0.5-Depth+BaseDepth/2 ])
         Tubes();
    }
 
 
     //translate([0,1/2*sin(SideAngle)*(Size-Height),0])
     translate([0,Height/2-SmallHoleRadious,SmallHoleRadious-Depth+BaseDepth/2])
         color([0.6,0.6,0.6], alpha=0.8)
     SidesComplete(SideAngle);

     translate([0,0,2*SideLength*sin(SideAngle)+ 2*Depth+Height-2*Depth+BaseDepth/2 ])
         rotate([0,180,0])
         color([0.6,0.4,0.1], alpha=0.8)
         BaseUp();

 
 
     // translate([(Size/2)-Depth-2*BaseDepth+0.25,20 ,1.5*Height])
     //     rotate([90,0,90]) 
     //     Pituto();
}


//ShowAll();
//color(alpha=0.7)
//Tubes();
//Cone();
//PitutoLargo();

//SolidBase();
//
Model();
//
//BaseHolderHole();
