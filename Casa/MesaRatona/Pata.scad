use<roundedcube_simple.scad>
$fn=64;
$fa = 2;
$fs = 0.25;

Redondez = 2;

AltoPortaRueda=10;
AnchoPortaRueda=40;
D_Tornillo = 4.5;
R_Tuerca = 5.25;
H_Tuerca = 4.5;

PataAncho = 152;
PataLargo = 20;
Espesor = 1;
PortaPataAncho = PataAncho+2*Espesor;
PortaPataLargo = PataLargo+2*Espesor;

AlturaPata = 20;




margen = 1.5; // Espacio adicional total/tolerancia entre el tamaño del agujero y la pata



// Calculate half dimensions for centered placement
bw2 = (PortaPataAncho-2*Redondez )/ 2;
bl2 = (PortaPataLargo-2*Redondez )/ 2;
ts2 = (AnchoPortaRueda-2*Redondez) / 2;

// Define the 8 vertices
// Vertices are listed starting from the bottom plane, then the top plane
points = [
    // Bottom vertices (Z=0)
    [-bw2, -bl2, 0], // Point 0: Bottom Left Back
    [bw2, -bl2, 0],  // Point 1: Bottom Right Back
    [bw2, bl2, 0],   // Point 2: Bottom Right Front
    [-bw2, bl2, 0],  // Point 3: Bottom Left Front

    // Top vertices (Z=AlturaPata)
    [-ts2, -ts2, AlturaPata-Redondez], // Point 4: Top Left Back
    [ts2, -ts2, AlturaPata-Redondez],  // Point 5: Top Right Back
    [ts2, ts2, AlturaPata-Redondez],   // Point 6: Top Right Front
    [-ts2, ts2, AlturaPata-Redondez]   // Point 7: Top Left Front
];

// Define the faces
// Points for each face must be listed in clockwise order when looking at the face from the outside
faces = [
    // Bottom face (points 0, 1, 2, 3)
    [0, 1, 2, 3],

    // Top face (points 7, 6, 5, 4)
    [7, 6, 5, 4],

    // Side faces (connecting bottom to top)
    [0, 3, 7, 4], // Left face
    [1, 0, 4, 5], // Back face
    [2, 1, 5, 6], // Right face
    [3, 2, 6, 7]  // Front face
];






module Estructura(){
// Create the polyhedron
 
    //translate([0,0,-AlturaPata-1.5*(AltoPortaRueda)+1+Redondez])
   //        roundedcube_simple([PortaPataAncho,PortaPataLargo,2*AltoPortaRueda+Redondez],5);

    translate([0,0,-AlturaPata-AltoPortaRueda/2+1+Redondez])
        minkowski(){
        polyhedron(points = points, faces = faces);
        sphere(Redondez);
        }

    roundedcube_simple([AnchoPortaRueda,AnchoPortaRueda,AltoPortaRueda],5);
}


module Pata(){
    translate([0,0,-AlturaPata -  AltoPortaRueda/2 - (AlturaPata-10)/2])
    cube([PataAncho+margen, PataLargo+margen, AlturaPata-10], center = true);
}


module Tuerca(R_Tuerca = R_Tuerca, H_Tuerca = H_Tuerca){
            cylinder(r=R_Tuerca, h=H_Tuerca, center=true, $fn=6);
}

module Agujeros(){
            // Sujeción a la mesa desde abajo
    for ( i = [ 1, -1]){

    translate([i*PataAncho/3, 0, - (PataAncho/3) * AlturaPata/(PataAncho/2) + Redondez ])
    {
               cylinder(r=6,  h=4, center=true);
               translate([0,0,-2])
                   cylinder(r2=4, r1=2,  h=4, center=true);
               cylinder(r=2, h = 2* AlturaPata, center=true);
               
    }
            

        for ( j = [1, -1]){
            translate([i*25/2, j*25/2,0])
            {
                Tuerca(); // Agujero de las tuercas
                cylinder(d = D_Tornillo, h = 2*AltoPortaRueda+1, center=true);// Agujero de los tornillos
            }
            translate([i*(AnchoPortaRueda-25/4)/2, j*25/2, 0])
                cube([(AnchoPortaRueda-25)/2,3/sqrt(3)*R_Tuerca, H_Tuerca], center=true); // PAra que la tuerca salga afuera

        }
    }
}

// El coso

difference(){
    Estructura();
    Agujeros();

}
   //color("brown") Pata();

