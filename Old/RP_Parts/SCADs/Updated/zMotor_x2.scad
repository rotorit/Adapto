// Copyright (C) 2012 t00tie
// After an stl designed by RoTorIT
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <configuration.scad>;
use <nemaMount.scad>

width=round(thickness+screwR+thickness*3+M3+motorcc+M3+thickness*3+screwR+thickness);

zMotor();

module zMotor(){
	difference(){
		union(){
			translate([0, -width/2, 0])
				cube([thickness, width, frameY]);
			translate([0, -round(thickness+M3/2+motorcc+M3/2+thickness)/2, 0])
				cube([thickness+10, round(thickness+M3/2+motorcc+M3/2+thickness), thickness]);
			translate([thickness+10, -round(thickness+M3/2+motorcc+M3/2+thickness)/2, 0])
				nemaMount();
			hull(){
				translate([thickness-1, -round(thickness*2+M3/2+motorcc/2), 0])
					cube([1, thickness, frameY]);
				translate([thickness+9+round(thickness+(18-M3)+motorcc+thickness), -round(thickness*2+M3/2+motorcc/2), 0])
					cube([1, thickness, thickness]);
			}
			mirror([0,1,0])
				hull(){
					translate([thickness-1, -round(thickness*2+M3/2+motorcc/2), 0])
						cube([1, thickness, frameY]);
					translate([thickness+9+round(thickness+(18-M3)+motorcc+thickness), -round(thickness*2+M3/2+motorcc/2), 0])
						cube([1, thickness, thickness]);
				};
			hull(){
				translate([thickness-1, -round(screwR+thickness*4+M3+motorcc/2)+.5, 0])
					cube([1, thickness*2+M3+thickness+1, thickness]);
				translate([thickness+9+round(thickness+(18-M3)+motorcc+thickness), -round(thickness*2+M3/2+motorcc/2), 0])
					cube([1, thickness, thickness]);
			}
			mirror([0,1,0])
				hull(){
					translate([thickness-1, -round(screwR+thickness*4+M3+motorcc/2)+.5, 0])
						cube([1, thickness*2+M3+thickness+1, thickness]);
					translate([thickness+9+round(thickness+(18-M3)+motorcc+thickness), -round(thickness*2+M3/2+motorcc/2), 0])
						cube([1, thickness, thickness]);
				};
		}// end union

		// holes to attach to the frame
		translate([-1, width/2-screwR-thickness, boltOffset])
			rotate([0,90,0])
			cylinder(r=screwR,h=thickness+2);
		mirror([0,1,0])
			translate([-1, width/2-screwR-thickness, boltOffset])
				rotate([0,90,0])
				cylinder(r=screwR,h=thickness+2);
	}// end difference
}