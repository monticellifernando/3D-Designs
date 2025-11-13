$fn=64;

ps = 5; // Pixel Size


module PlaceCube(punto, delta=0){

scale([ps, ps, ps])
translate(punto)
  cube([1,1,1+delta], center=true);
}

ContornoEspada = [[-1, 0, 0], [-1, -1, 0], [0, -1, 0], [1,-1,0], [1, 0, 0], [1,1,0], [0,1,0], [-1, 1, 0], [1,7,0], [1,8,0], [2,5,0], [2,6,0], [2,8,0], [3,4,0], [3,7,0]];


for ( v = ContornoEspada) {
	
	PlaceCube(v);
}
	

