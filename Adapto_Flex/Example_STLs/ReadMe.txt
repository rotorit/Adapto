These STLs were generated via openSCAD with the below configuration in the ./inc/configuration.scad file, and then run through InStep V2.3 to make absolutely sure they are tidy.
This is not likely default configuration for most users due to the ACME rod specs for the z axis but applies to my printers configuration specifically.

//==============//
// Basic Config //
//==============//
smoothRod=10;			// diameter of smooth rods in mm
linearBearing=lm10uu;		// change this to the linear bearing you are using from the definitions section
zRod=ACME14;			// change this to the z threaded rod you are using from the definitions section
zRodnut=ACME14nut;		// change this to the z nut you are using from the definitions section
zRodnutThickness=ACME14nutThickness;	// change this to the z nut thickness you are using from the definitions section

//=======================//
// Advanced Config Items //
//=======================//
$fn=200;			// default resolution for parts, decrease if part compiling or stl/gcode is unmanageable
xRodDistance=70;		// i3 xaxis_rod_distance=45, try this for compatible extruders, ymmv(not fully parametric yet)
thickness=5;			// thickness of walls etc. in parts
