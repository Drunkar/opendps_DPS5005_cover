use <./openscad_modules/modules/RoundedRectangle.scad>;
use <./openscad_modules/modules/RoundedCube.scad>;
use <./openscad_modules/modules/DiamondColumns.scad>;

thickness = 2;
x_base = 60;
y_base = 95;
z_base = 42.5;
x_pcb = 50;
y_pcb = 69;
r_basescrew = 1.2;
RESOLUTION = 50;


// reference
translate([thickness, thickness, 0]) {
    %color([1, 1, 0, 0.6]) rotate([0, 0, 90]) translate([0, -y_base, 0])
        import("C:/Users/comet/Dropbox/repos/opendps_DPS5005_cover/bottom_plate.stl");
    %color([0, 0, 0, 0.4]) translate([y_base-y_pcb-5, 0, 7])
        cube([y_pcb, 0.5, z_base - 7]);
}

color([0, 1, 1, 0.6])
difference() {
    RoundedCube(x=y_base+2*thickness, y=x_base+2*thickness, z=z_base+thickness, r=2, $fn=RESOLUTION);
    // sub
    //cube([y_base+2*thickness, x_base+2*thickness, z_base+thickness]);

    translate([thickness, thickness, 0])
        cube([y_base, x_base, z_base]);
    
    // front
    rotate([90, 0, 0]) mirror([0, 0, 1]) {
        
        // banana jack
        hull() {
            translate([7.2, 0, -1])
                cylinder(r=6, h=5, $fn=RESOLUTION);
            
            translate([7.2, 34, -1])
                cylinder(r=6, h=5, $fn=RESOLUTION);
        }
        
        // volume
        hull() {
            translate([y_base+2*thickness-13-9, 8.2, -1])
                RoundedRectangle(x=12, y=12, thickness=5, r=3, $fn=RESOLUTION);
            
            translate([y_base+2*thickness-13-3, 30, -1])
                cylinder(r=6, h=5, $fn=RESOLUTION);
        }
        
        // display
        translate([thickness+23, 8.2, -1])
            RoundedRectangle(x=43, y=32, thickness=5, r=3, $fn=RESOLUTION);
        
    }

    translate([thickness+0.5, thickness+1.5, z_base])
        DiamondColumns(num_x=7, num_y=8, h=5, r_hole_max=3);
    
    rotate([90, 0, 0])
        translate([thickness, 0, -x_base-2*thickness])
            DiamondColumns(num_x=7, num_y=6, h=80, r_hole_max=3);
    
    rotate([0, 90, 0])
        rotate([0, 0, 90])
            translate([0, 0.5, 0])
                DiamondColumns(num_x=5, num_y=6, h=100, r_hole_max=3);
    
    // screw holes
    rotate([0, 90, 0]) rotate([0, 0, 90]) mirror([0, 0, 1]) {
        translate([4, 0, -3]) {
            RoundedRectangle(x=10, y=12, thickness=5, r=1, $fn=RESOLUTION);
            cube([10, 6, 5]);
        }
        
        translate([x_base-10+2, 0, -3]) {
            RoundedRectangle(x=10, y=12, thickness=5, r=1, $fn=RESOLUTION);
            cube([10, 6, 5]);
        }
        
        translate([0, 0, -y_base-2*thickness+3]) {
            translate([4, 0, -5]) {
                RoundedRectangle(x=10, y=12, thickness=5, r=1, $fn=RESOLUTION);
                cube([10, 6, 5]);
            }
            
            translate([x_base-23, 0, -5]) {
                RoundedRectangle(x=10, y=12, thickness=5, r=1, $fn=RESOLUTION);
                cube([10, 6, 5]);
            }
            
            // dc jack
            translate([x_base-11, 5, -5]) {
                RoundedRectangle(x=9, y=11, thickness=5, r=1, $fn=RESOLUTION);
            }
        }
    }
    
    
    
}



translate([thickness, thickness, 39])
    cube([21, 2, z_base-39]);
translate([thickness+92, thickness, 39])
    cube([3, 2, z_base-39]);


rotate([0, 90, 0]) rotate([0, 0, 90]) mirror([0, 0, 1]) {
    translate([4, 0, -2]) {
        difference() {
            union() {
                RoundedRectangle(x=10, y=12, thickness=1, r=1, $fn=RESOLUTION);
                cube([10, 6, 1]);
            }
            translate([10/2, 6, 0])
                cylinder(r=1.5, h=10, $fn=RESOLUTION);
        }
    }
    
    translate([x_base-10+2, 0, -2]) {
        difference() {
            union() {
                RoundedRectangle(x=10, y=12, thickness=1, r=1, $fn=RESOLUTION);
                cube([10, 6, 1]);
            }
            translate([10/2, 6, 0])
                cylinder(r=1.5, h=10, $fn=RESOLUTION);
        }
    }
    
    translate([0, 0, -y_base-2*thickness+5]) {
        translate([4, 0, -4]) {
            difference() {
                union() {
                    RoundedRectangle(x=10, y=12, thickness=1, r=1, $fn=RESOLUTION);
                    cube([10, 6, 1]);
                }
                translate([10/2, 6, 0])
                    cylinder(r=1.5, h=10, $fn=RESOLUTION);
            }
        }
        
        translate([x_base-23, 0, -4]) {
            difference() {
                union() {
                    RoundedRectangle(x=10, y=12, thickness=1, r=1, $fn=RESOLUTION);
                    cube([10, 6, 1]);
                }
                translate([10/2, 6, 0])
                    cylinder(r=1.5, h=10, $fn=RESOLUTION);
            }
        }
    }
}
