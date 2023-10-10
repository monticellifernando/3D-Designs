$fn=10;

NroDeRayos=10;

rotate([180,0,0])
    difference(){
        scale(4.2) translate([-12.5,-12.5,-25])
            //import("Extra_Printable_Companion_Cube.STL", convexity=6);
            import("Weighted_Companion_Cube_33138.stl", convexity=6);
        translate([0,0,-45])
            cube([85,85,100], center=true);

        for (i=[0:NroDeRayos]){
            for (j=[0, 15, 22.5, 30]){
                rotate([0,0,360*i/NroDeRayos]) 
                    translate([j,0,-120]) 
                    cylinder(r=2, h=50);
            }
        }
    }
