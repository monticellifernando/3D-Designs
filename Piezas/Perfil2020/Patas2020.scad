$fn=12;

MargenImpresion = 0.2;
LargoPata = 20;
AnchoPata = 25; 


use<ProfileEndcap.scad>;


module Pata(){
    2020_ProfileEndcap();
    translate([10,10,-LargoPata/2+1]) 
    cylinder(r=AnchoPata/2, h=LargoPata, $fn=6,center=true);
}


Pata();
