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

//ShowAll();
//color(alpha=0.7)
//Tubes();
PitutoLargo();

