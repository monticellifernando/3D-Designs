include <PortalMaceta.scad>


// Base();
//     CuboHueco();
// SacarInterior();


 color([0.8,0.2,0], alpha=0.7)
     Maceta(125);
  // // 
 color([0.8,1,0.9], alpha=0.7)
    translate([0,0,-110])
     Rejilla(125);

    color([0,0.8,0.9], alpha=0.9)
    translate([0,0,20])
       Base(125);
