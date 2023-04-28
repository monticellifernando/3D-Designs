include <ParametrosCamaCNC.scad>;

module SoporteCNC(){

    union(){
        difference(){
            Base(); // La base en forma de rompecabezas
            TodosLosAgujeros(); //Todos los agujeros
        }
        Bordes(); // Los bordes con los topes
    }
}

module Bordes(){
    difference(){
        union(){
            translate([-Tamano/2+LargoTope/2, -Tamano/2-Altura,-Altura/2])
                rotate([-10,0,0])
                cube([LargoTope, Altura, 2*Altura]);
            translate([-Tamano/2-Altura,-Tamano/2+LargoTope/2, -Altura/2])
                rotate([0,10,0])
                cube([Altura, LargoTope, 2*Altura]);
        }
        translate([-Altura,-Altura,-Altura])
            cube([Tamano, Tamano, Altura],center=true);
    }
}

module TodosLosAgujeros(){
    union(){
        Ajugeros();
        AjugerosAgarre();
    }
}

module AjugeroAgarre(){
    union(){
        translate([0,0,-Altura/4])
            cylinder(h=Altura/2*1.1,r=3, center=true);

        //translate([0,0,Altura/4])
            cylinder(h=Altura/2*1.1,r1=3, r2=6, center=true);
        translate([0,0,Altura/2])
            cylinder(h=Altura/2*1.1,r=6, center=true);
    }
}

module AjugerosAgarre(){
    DistanciaAAy = 0.6*Tamano;
    DistanciaAAx = 0.75*Tamano;
    OffsetAA = 0.1*Tamano;
    union(){
        for (i = [ 0: 1]){
            for ( j= [0: 1]){
                translate([-Tamano/2 + OffsetAA + i*DistanciaAAx , -Tamano/2 + OffsetAA + j*DistanciaAAy, 0])
                    AjugeroAgarre();
            }
        }

    }
}
module Ajugeros(){
    Offset = 0*Tamano;
    t_NAguj=Tamano/DistanciaAgujeros ;
    NAguj = t_NAguj - t_NAguj%1;
    echo("NAguj = ");
    echo(NAguj);

    union(){
        for (i = [ 1: NAguj+1]){
            for ( j= [1: NAguj+1]){
                translate([-Tamano/2 + Offset + i*DistanciaAgujeros , -Tamano/2 + Offset + j*DistanciaAgujeros, 0])
                    cylinder(h=Altura*1.1, r=DiametroAgujeros/2,center=true);
            }
        }

    }
}
module Base(Diametro=Diametro, Altura=Altura, Tamano = Tamano){


    difference(){
        union(){
            cube([Tamano, Tamano, Altura],center=true);
            Cilindros(Diametro=Diametro, Altura=Altura, AnchoTotal = Tamano, Offset = Diametro/4);
            //:w
        }
        DiametroAgujero = Diametro+1.5;
        rotate([0,0,90])
        Cilindros(Diametro=(DiametroAgujero), Altura=1.1*Altura, AnchoTotal = Tamano, Offset = -Diametro/4 + 0.4);
    }
    echo("test");
    
}

module Cilindros(Diametro=Diametro, Altura=Altura, AnchoTotal=Tamano, Offset=0){
    t_NCils=AnchoTotal/Diametro*0.75 ;
    NCils = t_NCils - t_NCils%1;
    echo("NCils");
    echo(NCils);

    Spacing = AnchoTotal/NCils;

    union(){
        for (i = [0 : NCils-1] ){
            echo(i);
            translate([AnchoTotal/2+Offset, -AnchoTotal/2+Spacing/2+i*Spacing, 0])
                cylinder(h=Altura, r=Diametro/2,center=true);

        }
    }
    echo("test");
    echo(NCils);
    
    
}

SoporteCNC();
