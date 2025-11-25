$fn=64;

ps = 3; // Pixel Size

module Texto(texto, h=3){
    //scale(0.75)
    //translate([-5,1, 20])
        //rotate([90,90,0])
        linear_extrude(height = h) {
            text(texto, font = ":Bold");
        }
}

module PlaceCube(punto, delta=0){

scale([ps, ps, ps])
translate(punto) translate([0,0,delta/2])
  cube([1,1,1+delta], center=true);
}

ColorContorno = [0.2,0.4,0.4];
ColorMango = [0.6,0.4,0.1];
ColorInterior = [0.7,0.9,0.9];

ContornoEspada = [[-1, 0, 0],
               [-1,-1,0], [0,-1,0], [1,-1,0], [1,0,0], [1,1,0], [0,1,0], [-1,1,0],
               [1,7,0], [1,8,0],
               [2,5,0], [2,6,0], [2,8,0],
               [3,4,0], [3,7,0],
               [4,3,0], [4,5,0], [4,6,0],
               [5,2,0], [5,4,0], [5,7,0],
               [6,2,0], [6,4,0], [6,8,0],
               [7,1,0], [7,3,0], [7,5,0], [7,9,0],
               [8,1,0], [8,2,0], [8,6,0], [8,10,0],
               [9,7,0], [9,11,0],
               [10,8,0], [10,12,0],
               [11,9,0], [11,13,0],
               [12,10,0], [12,14,0],
               [13,11,0], [13,14,0],
               [14,12,0], [14,13,0], [14,14,0],
];

MangoEspada = [[1,1, 0],[1,2,0],
            [2,1, 0],[2,2,0],[2,3,0],
            [3,2, 0],[3,3,0],
];

InteriorEspada = [
    //[0,0,0],
               [2,7,0],
               [3,5,0], [3,6,0],
               [4,4,0],
               [5,3,0], [5,5,0], [5,6,0],
               [6,3,0], [6,5,0], [6,6,0], [6,7,0],
               [7,2,0], [7,6,0], [7,7,0], [7,8,0],
               [8,7,0], [8,8,0], [8,9,0],
               [9,8,0], [9,9,0], [9,10,0],
               [10,9,0], [10,10,0], [10,11,0],
               [11,10,0], [11,11,0], [11,12,0],
               [12,11,0], [12,12,0], [12,13,0],
               [13,12,0], [13,13,0],

];

module Espada(){

    for ( v = ContornoEspada) {
        color(ColorContorno)
            PlaceCube(v);
    }


    for ( v = MangoEspada) {
        color(ColorMango)
            PlaceCube(v,-0.1);
    }

    for ( v = InteriorEspada) {
        color(ColorInterior)
            PlaceCube(v,-0.2);
    }

}

difference(){
    Espada();
    rotate([0,0,45])
        translate([20,3,-2])
        scale(0.7)
        mirror([0,1,0])
        Texto("Manu");
}
