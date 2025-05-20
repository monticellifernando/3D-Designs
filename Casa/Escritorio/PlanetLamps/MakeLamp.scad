$fn=50;
Base=49.85; 

module Planeta(planeta){
import(planeta,convexity=100);
}

module HacerLampara(planeta){
    difference(){
        Planeta(planeta);
      translate([0,0,-1.5*Base])
          cube([2*Base,2*Base,Base+1],center=true);
    }

}
//HacerLampara("Moon_Outside_200.stl");
