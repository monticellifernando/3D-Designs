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

module BaseComplete(){
    Width=0.75*Size-4*BaseDepth-0.2;
    SolidBase();
    for (i=[-1,1]){
        translate([i*(-Size/2+Depth/2),(Width-Size)/2,Height/2+Depth])
            rotate([0,0,90*(-i+1)])
            BaseHolderWide();

        translate([-i*(-Size/2+Depth/2+Depth),-(Height-Size)/2,Height/2+Depth])
            rotate([0,0,90*(i+1)])
            BaseHolderHole();
    }


}

module PairOfSides(SideAngle, ZInverted){
    SideZDisplace=Depth+Height/2+(SideLength-(Height-2*HoleRadious))/2*sin(SideAngle);

    SideYDisplace=-(SideLength-Size)/2-(Height/2-HoleRadious);
    translate([0,SideYDisplace ,SideZDisplace])
        rotate([-90,SideAngle+(1-ZInverted)*180,-90]) 
        mirror([0,0,ZInverted])
        SidesMiddleHole();

    translate([-Depth*2*(1/2-ZInverted),SideYDisplace ,SideZDisplace])
        rotate([90,SideAngle+(1-ZInverted)*180,90]) 
        mirror([0,0,ZInverted])
        SidesMiddlePlug();
}

module SidesComplete(SideAngle){

    for (ZOffset = [0,1]){ 

        ZDisplacement = ZOffset*sin(SideAngle)*(SideLength);

        SideXDisplace = Size/2-1.5*Depth;

        for (i = [-1,1]){


//            mirror([0,ZOffset,0])
            translate([-i*SideXDisplace,0,ZDisplacement])
                mirror([(i+1)/2,0,0])
            //mirror([0,0,ZOffset])
                PairOfSides(SideAngle, ZOffset);
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
    BaseComplete();



//     translate([0,-Height+SmallHoleRadious,Height+SideLength*sin(SideAngle)])
//         rotate([180,0,0])
//         Tubes();

    translate([-Size/2+2*Depth,-Height+SmallHoleRadious,Height+SideLength*sin(SideAngle)])
        rotate([90,0,90])
        PitutoLargo();

    translate([Size/2,0,2* Height])
        rotate([0,-90,0]) SmallCup();
    translate([Size/2,Height,2* Height])
        rotate([0,-90,0]) Cup();





    //translate([0,1/2*sin(SideAngle)*(Size-Height),0])
    translate([0,Height/2-SmallHoleRadious,SmallHoleRadious])
    SidesComplete(SideAngle);


    translate([(Size/2)-Depth-2*BaseDepth+0.25,20 ,1.5*Height])
        rotate([90,0,90]) 
        Pituto();
}


//ShowAll();
//color(alpha=0.7)
//Tubes();
//Cone();
//PitutoLargo();

//SolidBase();
//
Model();
