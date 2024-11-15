$fn=50;
LargoEncastre = 25;
module Tubo(LargoParte=100){
    difference(){
        union(){
            translate([0,0,LargoParte/2 - LargoParte/8 ])
                cylinder(r=20, h = LargoEncastre, $fn=6,center=true);
            cylinder(r=17, h = LargoParte, $fn=6,center=true);
        }
        cylinder(r=12.5, h = LargoParte+1, center=true);
        translate([0,0,LargoParte/2 - LargoParte/8 + 5])
            cylinder(r=17.75, h = LargoEncastre, $fn=6,center=true);
        translate([0,0,LargoParte/2 - LargoEncastre-2.25  ])
            cylinder(r2=17.75, r1=10, h = 15, $fn=6,center=true);
    }
    //     translate([0,0,LargoParte/2 - 7.5 ])
    //         cylinder(r2=17, r1=10, h = 15, $fn=6,center=true);
    //
    //
}

module Fin(){
    //        translate([0,0,LargoEncastre])

    difference(){    
        cylinder(r=20, h = 3*LargoEncastre, $fn=6,center=true);
        translate([0,0,0.75*LargoEncastre+5])
            cylinder(r=17.75, h = 1.5*LargoEncastre, $fn=6,center=true);
        translate([0,0,2.5+0.1])
            cylinder(r2=17.75, r1=10, h = 5, $fn=6,center=true);
        cylinder(r=13, h = 4*LargoEncastre, center=true);
    }


}
