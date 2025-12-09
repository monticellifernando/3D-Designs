/*
 * Toy Gyroscope v0.8
 *
 * http://www.thingiverse.com/thing:20577
 * By: Alan Yates <thingiverse@alanyates.com>
 * 
 */

// geometry
inner_diameter = 50;
width = 8;
thickness = 2.5;
spacing = 5;

// tolerances
rotor_clearance = spacing/2;
pin_extra = 1;
base_slop = 0.1;
overlap = 1;
axle_sides = 8;
axle_slop = 0.1;
$fn = 100;

if(false) {
	gimbal(0, inner_diameter, spacing, thickness, width);
	rotate(90, [0,0,1])
		gimbal(1, inner_diameter, spacing, thickness, width);
	gimbal(2, inner_diameter, spacing, thickness, width);

	frame(inner_diameter, spacing, thickness, width);

	translate([-width, 0, width/2])
		rotate(90, [0,1,0])
			rotor(inner_diameter, 2*width, width);

	axle(inner_diameter, spacing, width);
} else {
//	projection(cut=true)
//		translate([0,0,-width/2])
		//	gyro();
            base(50, 5, 2.5, 8, 3, 95, "IFLP 2025", "Trivia", -20 );
}

// full gyro
module gyro(gimbal_count = 3) {
	// X, Y and Z gimbals
	for(i = [0 : 1 : gimbal_count - 1] ) {
		rotate(i*90, [0,0,1])
			gimbal(i, inner_diameter, spacing, thickness, width);
	}

	// outer frame
	frame(inner_diameter, spacing, thickness, width);

	// rotor
	rotor(inner_diameter, width, width);
	axle(inner_diameter, spacing, width);
}

// axle
module axle(diameter, spacing, width) {
	$fn = axle_sides;
	translate([-diameter/2 - pin_extra, 0, width/2])
		rotate(90, [0, 1, 0]) rotate(180/axle_sides, [0, 0, 1])
			union() {
				translate([0, 0, 1.5*spacing + pin_extra])
					cylinder(r = width/2, h = diameter - (3*spacing));
				translate([0, 0, diameter - 1.5*spacing])
					cylinder(r1 = width/2, r2 = 0, h = 1.5*spacing + overlap + pin_extra);
				translate([0, 0, 0])
					cylinder(r1 = 0, r2 = width/2, h = 1.5*spacing + overlap + pin_extra);
			}
}

// rotor
module rotor(diameter, thickness, width) {
	od = sqrt(diameter*diameter - thickness*thickness) - 2*rotor_clearance;
	difference() {
		cylinder(r = od/2, h = thickness);
		translate([0, 0, -overlap])  rotate(180/axle_sides, [0, 0, 1])
			cylinder(r = width/2 + axle_slop, h = thickness + 2*overlap, $fn = axle_sides);
	}
}

// outer frame
module frame(id, spacing, thickness, width, gimbal_count = 3) {
	diameter = id + 2*(gimbal_count)*(spacing + thickness);

	outer_gimbal(diameter, thickness*2, width, spacing);
	translate([-diameter/2 - id/3 - 2*spacing, 0, 0])
        base(id, spacing, thickness, width, gimbal_count, diameter);
}

module base(id, spacing, thickness, width, gimbal_count, diameter, Texto="IFLP 2025", Puesto="1", m_offset = -9){

    Escala = 1;
    difference() {
        echo (id);
        echo (spacing);
        echo (thickness);
        echo (width);
        echo (gimbal_count);
        echo (diameter);
        cylinder(r1 = 20+ id/3, r2 = 20+ id/(3*sqrt(2)), h = 3*thickness);				translate([3/2*thickness + base_slop, 0, diameter/2 + 3*thickness])
            rotate(-90, [0,1,0])
            outer_gimbal(diameter, thickness*2, width+2*base_slop, spacing);

        // Texto
    translate([18 , -24, 5.5])
        rotate([0,0,90])    
        linear_extrude(height = 2.5) {
            scale([Escala*0.75,Escala*0.75,Escala*1])
                text(Texto, font = ":Bold");
        }
    

    // Puesto
    translate([-10 , m_offset, 5.5])
        rotate([0,0,90])    
        linear_extrude(height = 2.5) {
            if (m_offset  == -9 ){
            scale([Escala*2,Escala*2,Escala*1])
                text(Puesto, font = ":Bold");
            }else{
                scale([Escala,Escala,Escala*1])
                    text(Puesto, font = ":Bold");
            }
        }
    }

}

// pivot cone
// diameter base, length in height, at origin, pointing Z+
module pivot_pin(diameter, length) {
	cylinder(r1 = diameter/2, r2 = 0, h = length);
}

// pivot biconical socket
// diameter base, depth height, overlap, at origin, pointing Z+
module pivot_socket(diameter, depth) {
	difference() {
		cylinder(r1 = diameter/2, r2 = 0, h = depth + overlap);
		translate([0, 0, overlap])
			cylinder(r1 = 0, r2 = diameter/2, h = depth + overlap);
	}
}

// ring part of a gimble
// id inner diameter, thickness web, width height, at origin, Z+
module gimbal_ring(id, thickness, width) {
	od = id + 2*thickness;
	difference() {
		cylinder(r = od/2, h = width);
		translate([0,0,-overlap])
			cylinder(r = id/2, h = width + 2*overlap);
	}
}

// complete gimble ring + pivots + sockets5
// id inner diameter, thickness web, width height, at origin, Z+
module gimbal(n, base_diameter, spacing, thickness, width) {
	id = base_diameter + 2*n*(spacing + thickness);
	pin_length = spacing + pin_extra;

	union() {
		// ring
		gimbal_ring(id, thickness, width);

		// pivots
		translate([0,-id/2,width/2])
			rotate(90, [1,0,0])
				pivot_pin(width, pin_length + thickness);
		translate([0,id/2,width/2])
			rotate(-90, [1,0,0])
				pivot_pin(width, pin_length + thickness);

		// sockets
		translate([id/2 + overlap,0,width/2])
			rotate(-90, [0,1,0])
				pivot_socket(width, (2/3)*pin_length);
		translate([-id/2 - overlap,0,width/2])
			rotate(90, [0,1,0])
				pivot_socket(width, (2/3)*pin_length);
	}
}

module outer_gimbal(id, thickness, width, pin_length) {
	od = id + 2*thickness;
	union() {
		difference() {
				gimbal_ring(id, thickness, width);
				translate([0,-od/2,0])
				difference() {
					translate([0,0,-overlap])
						cube([od/2+overlap, od + (2*overlap), width + (2*overlap)]);
					translate([0,od+overlap,(width/2)])
						rotate(90,[1,0,0])
						cylinder(r = (width+2*overlap)/2, h = od + 2*overlap);
				}
		}
		// sockets
		translate([0,-id/2,width/2])
			rotate(-90, [1,0,0])
				pivot_socket(width, (2/3)*pin_length);
		translate([0,id/2,width/2])
			rotate(90, [1,0,0])
				pivot_socket(width, (2/3)*pin_length);
	}
}
