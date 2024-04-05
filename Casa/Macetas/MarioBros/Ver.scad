include <MarioMaceta.scad>


Tamano=150;

EspesorParedes=1.5;
 translate([0,0,5])
// // color([0.8,0.2,0], alpha=0.7)
      Maceta(Tamano);
// //  // // 
//  color([0.8,1,0.9], alpha=0.7)
//     translate([0,0,10]) 
//      Rejilla(Tamano);
  
     color([0,0.8,0.9], alpha=0.9)
        Base( Tamano );


//     SacarInterior(150,11);


//     Base(150);
