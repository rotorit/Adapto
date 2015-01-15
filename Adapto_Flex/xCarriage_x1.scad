// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

xCarriage_Flex();

module xCarriage_Flex(){

	difference(){

		union(){

			// comment this out if you are using zip ties to secure the belt
			// otherwise this plate will clamp the belt in place
			translate([51, 46, 0])
				rotate([0, 0, 90])
				belt_clamp();

			// base plate
			translate([-100/2, -70/2, 0])
				cube([100, 70, thickness]);

			// linear bearing traps
			translate([100/2-linearBearing[2], 70/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1]+thickness*2, h=linearBearing[2]);
			translate([-100/2, 70/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1]+thickness*2, h=linearBearing[2]);
			translate([-linearBearing[2]/2, -70/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1]+thickness*2, h=linearBearing[2]);

			// back plate bearing trap reinforcements
			translate([linearBearing[2]/2-thickness, -70/2, 0])
				cube([thickness*3, 70, linearBearing[0]]);
			translate([-linearBearing[2]/2-thickness*2, -70/2, 0])
				cube([thickness*3, 70, linearBearing[0]]);

			// belt bracket
			hull(){
				translate([-linearBearing[2]/2, pullyDiameter/2, thickness+10+rotaryBearing[2]+thickness-1])
					cube([linearBearing[2], thickness, 1]);				
				translate([linearBearing[2]/2+thickness*2-1, pullyDiameter/2, thickness])
					cube([1, thickness, thickness]);
				translate([-linearBearing[2]/2-thickness*2, pullyDiameter/2, thickness])
					cube([1, thickness, thickness]);
			}
			// belt clamp points, one above and one below the belt bracket
			hull(){
				translate([linearBearing[2]/2-1, pullyDiameter/2+thickness*2, thickness])
					cube([1, thickness, thickness]);
				translate([-linearBearing[2]/2, pullyDiameter/2+thickness*2, thickness])
					cube([1, thickness, thickness]);
			}
			hull(){
				translate([linearBearing[2]/2-1, pullyDiameter/2-thickness*2, thickness])
					cube([1, thickness, thickness]);
				translate([-linearBearing[2]/2, pullyDiameter/2-thickness*2, thickness])
					cube([1, thickness, thickness]);
			}

			// bolt head raised traps
			translate([100/2-5, 70/2-20, thickness])
				polycyl(d=M5nut*2, h=M5nutThickness);
			translate([-100/2+5, 70/2-20, thickness])
				polycyl(d=M5nut*2, h=M5nutThickness);
			translate([100/2-5, -70/2+15, thickness])
				polycyl(d=M5nut*2, h=M5nutThickness);
			translate([-100/2+5, -70/2+15, thickness])
				polycyl(d=M5nut*2, h=M5nutThickness);

			// the X smooth rods
			%translate([-300/2, 70/2, thickness+linearBearing[1]/2])
				rotate([90, 0, 90])
				polycyl(d=smoothRod, h=300);
			%translate([-300/2, -70/2, thickness+linearBearing[1]/2])
				rotate([90, 0, 90])
				polycyl(d=smoothRod, h=300);

			// the linear bearings
			%translate([100/2-linearBearing[2], 70/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);
			%translate([-100/2, 70/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);

			%translate([-linearBearing[2]/2, -70/2, thickness+linearBearing[1]/2])
				rotate([0, 90, 0])
				polycyl(d=linearBearing[1], h=linearBearing[2]);

		}// end union

		// the linear bearing channels
		translate([-300/2, 70/2, thickness+linearBearing[1]/2])
			rotate([0, 90, 0])
			polyhole(d=linearBearing[1], h=300);
		translate([-300/2, -70/2, thickness+linearBearing[1]/2])
			rotate([0, 90, 0])
			polyhole(d=linearBearing[1], h=300);
		translate([-300/2, 70/2-2, linearBearing[1]-thickness])
			cube([300, 4, thickness*5]);
		translate([-300/2, -70/2-2, linearBearing[1]-thickness])
			cube([300, 4, thickness*5]);

		// zip tie holes
		difference(){
			translate([100/2-linearBearing[2]/2-thickness/2, 70/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2+5, h=thickness);
			translate([100/2-linearBearing[2]/2-thickness/2, 70/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2, h=thickness);
		}
		difference(){
			translate([-100/2+linearBearing[2]/2-thickness/2, 70/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2+5, h=thickness);
			translate([-100/2+linearBearing[2]/2-thickness/2, 70/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2, h=thickness);
		}
		difference(){
			translate([-thickness/2, -70/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2+5, h=thickness);
			translate([-thickness/2, -70/2, thickness+linearBearing[1]/2])
				rotate([0,90,0])
				polycyl(d=linearBearing[1]+thickness*2, h=thickness);
		}

		// belt trap
		translate([-thickness/2, pullyDiameter/2-1, thickness+10])
			cube([thickness, thickness+2, rotaryBearing[2]]);
		translate([thickness, pullyDiameter/2-1, thickness+10+rotaryBearing[2]+thickness-M3+1])
			rotate([-90, 0, 0])
			polyhole(d=M3, h=thickness+2);
		translate([-thickness, pullyDiameter/2-1, thickness+10+rotaryBearing[2]+thickness-M3+1])
			rotate([-90, 0, 0])
			polyhole(d=M3, h=thickness+2);

		// bolt holes
		translate([100/2-5, 70/2-20, -1])
			polyhole(d=M5, h=thickness*2+2);
		translate([-100/2+5, 70/2-20, -1])
			polyhole(d=M5, h=thickness*2+2);
		translate([100/2-5, -70/2+15, -1])
			polyhole(d=M5, h=thickness*2+2);
		translate([-100/2+5, -70/2+15, -1])
			polyhole(d=M5, h=thickness*2+2);

		// bolt head traps
		translate([100/2-5, 70/2-20, thickness])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);
		translate([-100/2+5, 70/2-20, thickness])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);
		translate([100/2-5, -70/2+15, thickness])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);
		translate([-100/2+5, -70/2+15, thickness])
			rotate([0, 0, 90])
			polynut(d=M5nut, h=M5nutThickness+1);

		// flatten the sides
		translate([-70, -70, -70/3])
			cube([20, 70*2, 70]);
		translate([50, -70, -70/3])
			cube([20, 70*2, 70]);

	}// end difference

}

module belt_clamp(){
	difference(){

		// belt clamp
		hull(){
			translate([thickness*2-2, 70/2+5, 0])
				cube([1, 10+rotaryBearing[2]+thickness, thickness]);
			translate([-thickness*2+1, 70/2+5, 0])
				cube([1, 10+rotaryBearing[2]+thickness, thickness]);
		}

		translate([thickness, 70/2+5+10+rotaryBearing[2]+thickness-M3+1, -1])
			polyhole(d=M3, h=thickness+2);
		translate([-thickness, 70/2+5+10+rotaryBearing[2]+thickness-M3+1, -1])
			polyhole(d=M3, h=thickness+2);

	}

}