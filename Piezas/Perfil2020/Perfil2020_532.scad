$fn=64;

MargenImpresion = 0.2;
Tuerca_h = 6;
TuercaR  = 4.7+MargenImpresion;
AgujeroR = 2+MargenImpresion; 

Largo = 12;



Trapecio_h1 = 1.8-MargenImpresion;
Trapecio_h2 = 2.5;

Trapecio_b1 = 10.5 - MargenImpresion;
Trapecio_b2 = 6.2;


module Perfil(){
    //     translate([Trapecio_h2,0,0])
    //     import("T-nut_M3_2020_aluprofile.stl", convexity=6);
    //
    cube([Largo,Trapecio_b1, Trapecio_h1], center=true);
    difference(){
        translate([0,0,(Trapecio_h1+Trapecio_h2)/2])
            cube([Largo,Trapecio_b1, Trapecio_h2], center=true);
        for ( i = [-45, 45] ) {
            rotate([i,0,0]) translate([0,0,Trapecio_h1/2+Trapecio_h1+Trapecio_b2*1.1]) cube([21,21,10],center=true);

        }
    }
}


module Tuerca532(){
    translate([0,0,(Trapecio_h2+Trapecio_h1)/2 -0.05]) rotate([0,0,0])
    cylinder(r=TuercaR, h=Tuerca_h, $fn=6,center=true);
}


difference(){
    Perfil();
    Tuerca532();
    cylinder(r=AgujeroR, h=10, center=true);
}
