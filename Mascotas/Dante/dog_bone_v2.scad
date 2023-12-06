// MODIFY HERE !!!
line1_text = "Dante"; //<-- Modify !!!
line1_fontsize = 4;
line1_fontthickness = 0.5;
line2_text = "011 6850-0000"; //<-- Modify !!!
line2_fontsize = 3;
line2_fontthickness = 0.5;
// END MODIFY HERE

x_size=15;
y_size=22.5;
z_size=2;


module Cielo(){
    scale([0.7,0.7,0.11])
        import("paradise-dante.stl");
//        translate([0,0,7]) cube([100,160,14],center=true);


}


module Bone(){
    //plate
    cube([x_size,y_size,z_size]);

    //right rings
    translate ([2,0,0]) cylinder (h=z_size, r=x_size/2, $fn=50);
    translate ([x_size-2,0,0]) cylinder (h=z_size, r=x_size/2, $fn=50);

    //left rings
    translate ([2,y_size,0]) cylinder (h=z_size, r=x_size/2, $fn=100);
    translate ([x_size-2,y_size,0]) cylinder (h=z_size, r=x_size/2, $fn=50);

    //key ring
    translate ([x_size, y_size/2,0]) {
        difference() {
            cylinder (h=z_size, r=y_size/6, $fn=50);
            translate([0,0,-0.01]) color ([0,1,0,1]) cylinder (h=z_size+0.02, r=y_size/14, $fn=50);
        }
    }

    //TEXT
    color ([1,0,0]) translate([10,11,z_size]) rotate([0,0,270]) letter(str(line1_text), line1_fontsize, line1_fontthickness);
    color ([1,0,0]) translate([4,11,z_size]) rotate([0,0,270]) letter(str(line2_text), line2_fontsize, line2_fontthickness);
}

module letter(l, letter_size, letter_height) {
    //letter_size = 4;
    //letter_height = 1;
    font = "Liberation Sans:style=Bold";
	// Use linear_extrude() to make the letters 3D objects as they
	// are only 2D shapes when only using text()
	linear_extrude(height = letter_height) {
		text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
	}
}

difference(){
    translate([-7.5,-10.5,0])
        Bone();

    translate([0,0,0.49])
    Cielo();
}
