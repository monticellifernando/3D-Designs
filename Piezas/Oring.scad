$fn=32;

// Imprimir con Flex! 

OringHeight=1;
OringRadOut=7;
OringRadIn=3;

difference(){
    cylinder(r=OringRadOut, h=OringHeight, center=true);
    cylinder(r=OringRadIn, h=OringHeight+1, center=true);
}

