use <./openscad_modules/modules/RoundedRectangle.scad>;
use <./openscad_modules/modules/BananaJackMounter.scad>;
use <./openscad_modules/modules/HoneyCombPlate.scad>;

thickness = 2;
x_base = 60;
y_base = 95;
x_pcb = 50;
y_pcb = 69;
r_basescrew = 1.2;
RESOLUTION = 50;



difference() {
    BasePlate();
    
    // screw holes
    translate([x_base-2.54-44.45, 2.54+5, 0]) {
        cylinder(r=r_basescrew, h=thickness, $fn=RESOLUTION);
        cylinder(r=2, h=1, $fn=RESOLUTION);
    }
    translate([x_base-2.54, 2.54+5, 0]) {
        cylinder(r=r_basescrew, h=thickness, $fn=RESOLUTION);
        cylinder(r=2, h=1, $fn=RESOLUTION);
    }
    
    // screw holes
    translate([x_base-2.54-44.45, 2.54+5+64.2, 0]) {
        cylinder(r=r_basescrew, h=thickness, $fn=RESOLUTION);
        cylinder(r=2, h=1, $fn=RESOLUTION);
    }
    translate([x_base-2.54, 2.54+5+64.2, 0]) {
        cylinder(r=r_basescrew, h=thickness, $fn=RESOLUTION);
        cylinder(r=2, h=1, $fn=RESOLUTION);
    }
}

// dc jack
rotate([90, 0, 0])
    translate([x_base-15, 0, -4]) {
        difference() {
            RoundedRectangle(9+5+1, 19, 4, 1, RESOLUTION);
            translate([2, thickness+3, 0])
                RoundedRectangle(9, 11, 4, 1, RESOLUTION);
        }
    }

// BananaJack
translate([0, y_pcb+5, thickness]) {
    difference() {
        cube([thickness, y_base-y_pcb-5, 37]);
        rotate([0, 90, 0]) rotate([0, 0, 270]) {
            translate([-15, -15, 0])
                cylinder(r=4, h=5, $fn=RESOLUTION);
            translate([-15, -15-18, 0])
                cylinder(r=4, h=5, $fn=RESOLUTION);
        }
    }
    translate([0, y_base-y_pcb-5-5.2, 32])
    rotate([0, 90, 0]) rotate([0, 0, 270])
        BananaJackMounter($fn=RESOLUTION);

    translate([0, y_base-y_pcb-5-5.2, 15])
    rotate([0, 90, 0]) rotate([0, 0, 270])
        BananaJackMounter($fn=RESOLUTION);

    translate([2, 1.2, 0])
        rotate([90, 0, 0])
            HoneyCombPlate(
                x=20.5,
                y=40,
                thickness=1.2,
                padding=0,
                r_honeycomb=3.1,
                margin_honeycomb=0.3
            );
}

// pcb
% translate([x_base-x_pcb, 5, thickness+2]) {
    difference() {
        cube([x_pcb, y_pcb, 1]);
        translate([0, 12, 0])
            cube([29, y_pcb-12*2, 1]);
    }
    translate([x_pcb-4-9, -1, 1])
        cube([9, 15, 11]);
}

module BasePlate() {
    cube([x_base, y_base, thickness]);
    
    // base
    translate([0, 5+12, 0])
        cube([x_base-x_pcb+8, y_pcb-12*2, 3+thickness+2]);
    translate([x_base-x_pcb+8, 5+12, 0])
        cube([x_base-x_pcb+8, y_pcb-12*2, 1.2+thickness+2]);
    // stopper
    translate([x_base-x_pcb+8+(x_base-x_pcb+8)-5.5, 5+12, 0])
        cube([5.5, y_pcb-12*2, 1.2+thickness+2+5]);
    translate([0, 0, thickness])
        cube([2, 5, 10]);

    // graves for display plate
    translate([0, 5, thickness]) {
        cube([2, y_pcb, 5]);
        translate([0, 8.7, 5])
            cube([2, 2, 1]);
        translate([0, 33.2, 5])
            cube([2, 2, 1]);
        translate([0, 58.5, 5])
            cube([2, 2, 1]);
    }
    
    // screw hole
    rotate([90, 0, 0]) {
        translate([5, 0, -5]) {
            translate([-3, 0, 0])
            difference() {
                RoundedRectangle(10, 12, 5, 1, RESOLUTION);
                translate([10/2, 6, 0])
                    cylinder(r=1.5, h=10, $fn=RESOLUTION);
            }
            
            translate([x_base-15-15, 0, 0])
            difference() {
                RoundedRectangle(10, 12, 5, 1, RESOLUTION);
                translate([10/2, 6, 0])
                    cylinder(r=1.5, h=10, $fn=RESOLUTION);
            }
            
            translate([0, 0, -y_base+5]) {
                translate([-3, 0, 0])
                difference() {
                    RoundedRectangle(10, 12, 5, 1, RESOLUTION);
                    translate([10/2, 6, 0])
                        cylinder(r=1.5, h=10, $fn=RESOLUTION);
                }
                
                translate([x_base-15, 0, 0])
                difference() {
                    RoundedRectangle(10, 12, 5, 1, RESOLUTION);
                    translate([10/2, 6, 0])
                        cylinder(r=1.5, h=10, $fn=RESOLUTION);
                }
            }
        }
    }
}
