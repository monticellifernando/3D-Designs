// Dimensiones
outer_diameter = 27; // Diámetro exterior
inner_diameter = 24; // Diámetro interior
thickness = 3;       // Espesor total
inner_step_diameter = 23; // Diámetro del escalón interno
inner_step_thickness = 1.5; // Espesor del escalón interno

module corona_circular() {
//    difference() {
        // Cilindro exterior completo
        cylinder(d = outer_diameter, h = thickness, $fn=100);
        
        // Crear el hueco interior completo
        translate([0, 0, -1])
            cylinder(d = inner_diameter, h = thickness + 2, $fn=100);
        
        // Crear el escalón interno
        translate([0, 0, 1.5])
            cylinder(d = inner_step_diameter, h = thickness - inner_step_thickness, $fn=100);
 //   }
}

// Llamar al módulo para generar la pieza
corona_circular();



