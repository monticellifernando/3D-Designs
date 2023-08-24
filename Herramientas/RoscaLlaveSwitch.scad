$fn=50;

use<../threads-scad/threads.scad>


    ScrewHole(outer_diam = 6, height=15, pitch=8/12,  tooth_angle=45)
        cylinder(h=3  ,r=7, $fn=8);
