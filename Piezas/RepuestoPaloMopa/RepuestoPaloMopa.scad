$fn=50;
LargoParte = 100;

difference(){
    union(){
        translate([0,0,LargoParte/2 - LargoParte/8 ])
            cylinder(r=20, h = LargoParte/4, $fn=6,center=true);
        cylinder(r=17, h = LargoParte, $fn=6,center=true);
    }
    cylinder(r=12.5, h = LargoParte+1, center=true);
    translate([0,0,LargoParte/2 - LargoParte/8 + 5])
        cylinder(r=17.75, h = LargoParte/4, $fn=6,center=true);
    translate([0,0,LargoParte/2 - LargoParte/4-2.25  ])
        cylinder(r2=17.75, r1=10, h = 15, $fn=6,center=true);
}
//     translate([0,0,LargoParte/2 - 7.5 ])
//         cylinder(r2=17, r1=10, h = 15, $fn=6,center=true);
