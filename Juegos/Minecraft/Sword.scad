$fn=64;

ps = 5; // Pixel Size


module PlaceCube(punto, delta=0){

translate(punto)
  cube([ps,ps,ps+delta], center=true);
}

ContornoEspada = [[-ps, 0, 0], [-ps, -ps, 0], [0, -ps, 0], [ps,-ps,0], [ps, 0, 0], [ps,ps,0], [0,ps,0], [-ps, ps, 0], [1*ps,7*ps,0], [1*ps,8*ps,0], [2*ps,5*ps,0], [2*ps,6*ps,0], [2*ps,8*ps,0], [3*ps,4*ps,0], [3*ps,7*ps,0]];


for ( v = ContornoEspada) {
	PlaceCube(v);
}
	

