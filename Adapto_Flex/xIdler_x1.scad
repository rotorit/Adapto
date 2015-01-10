// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>
use <./inc/xBacker.scad>

xIdler_Flex();

module xIdler_Flex(){

	difference(){

		union(){

			xBacker_Flex();// import the base x backing model
			hull(){
				translate([-(1.41*31+thickness*2+M3)/2, 30-18/2-6,  thickness*2+linearBearing[1]])
					cube([1.41*31+thickness*2+M3, 1, 1]);
				translate([-(1.41*31+thickness*2+M3)/2, 30-rotaryBearing[0],  thickness*2+linearBearing[1]])
					cube([1.41*31+thickness*2+M3, rotaryBearing[0], thickness+rotaryBearing[2]+thickness*2.5]);
			}

		}// end union

		%translate([rotaryBearing[1]/2-pullyDiameter/2, 30, thickness*2+linearBearing[1]+thickness*2])
			polycyl(d=rotaryBearing[1], h=rotaryBearing[2]);
		hull(){
			translate([rotaryBearing[1]/2-pullyDiameter/2, 0, thickness*2+linearBearing[1]+thickness*2-.25])
				polycyl(d=rotaryBearing[1]+5, h=rotaryBearing[2]+.5);
			translate([rotaryBearing[1]/2-pullyDiameter/2, 30, thickness*2+linearBearing[1]+thickness*2-.25])
				polycyl(d=rotaryBearing[1]+5, h=rotaryBearing[2]+.5);
		}

		%translate([rotaryBearing[1]/2-pullyDiameter/2, 30, thickness*2+linearBearing[1]+thickness])
			polycyl(d=rotaryBearing[0], h=rotaryBearing[2]+thickness*2);
		translate([rotaryBearing[1]/2-pullyDiameter/2, 30, thickness*2+linearBearing[1]+thickness])
			polycyl(d=rotaryBearing[0], h=rotaryBearing[2]+thickness*2);
		
	}// end difference

}

