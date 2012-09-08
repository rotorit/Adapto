// Wade's Extruder Gears using Parametric Involute Bevel and Spur Gears by GregFrost
// by Nicholas C. Lewis (A RepRap Breeding Program)
//
// It is licensed under the Creative Commons - GNU GPL license.
// © 2010 by Nicholas C. Lewis
// http://www.thingiverse.com/thing:4305

use <mendel_misc.inc>
use <parametric_involute_gear_v5.0.scad>

//----------------------***----------------------------
//HERE YU CHOOSE WHAT GEAR TO MAKE. JUST REMOVE THE // IN FRONT OF THE MODULE YOU WANT TO ACTIVATE


//WadesL(); //this module call will make the large gear
//For the  Adapto it is recmmended to use 36 teeths. absolute max is 37.

//WadesS();  //this module call will make the small gear
//For the Adapto small gear, 13 teeths is ok

module WadesL(){
	//Large WADE's Gear
	//rotate([0,0,-2])translate([0,0,0])color([ 100/255, 255/255, 200/255])import_stl("39t17p.stl");
	difference(){
		gear (number_of_teeth=36,
			circular_pitch=268,
			gear_thickness = 5,
			rim_thickness = 7,
			rim_width = 3,
			hub_thickness = 13,
			hub_diameter = 25,
			bore_diameter = 8,
			circles=0);
		translate([0,0,6])rotate([180,0,0])m8_hole_vert_with_hex(100);
	}
}
//End of the gear config part.
//----------------------***----------------------------
module WadesS(){
	//small WADE's Gear
	//rotate([180,0,-23.5])translate([-10,-10,-18])color([ 100/255, 255/255, 200/255])import_stl("wades_gear.stl");
	difference(){
		gear (number_of_teeth=13,
			circular_pitch=268,
			gear_thickness = 9,
			rim_thickness = 9,
			hub_thickness = 18,
			hub_diameter = 20,
			bore_diameter = 5,
			circles=0);
		translate([0,-5,16])cube([5.5,2.3,9],center = true);
		translate([0,0,14])rotate([0,90,-90])cylinder(r=1.7,h=20);
	}
}
