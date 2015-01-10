These STLs were generated via openSCAD with the below settings in the ./inc/configuration.scad file.

!!!This is not likely default configuration for most users due to the ACME rod specs for the z axis but applies to GearheadRed's printer configuration specifically.

//====================//
// Basic Config Items //
//====================//
smoothRod=10;			// diameter of smooth rods in mm
linearBearing=lm10uu;		// change this to the linear bearing you are using from the definitions section
zRod=ACME14;			// change this to the z threaded rod you are using from the definitions section
zRodnut=ACME14nut;		// change this to the z nut you are using from the definitions section
zRodnutThickness=ACME14nutThickness;	// change this to the z nut thickness you are using from the definitions section

//=======================//
// Advanced Config Items //
//=======================//
$fn=200;			// default resolution for parts, decrease if part compiling or stl/gcode is unmanageable
thickness=5;			// thickness of walls etc. in parts
smoothRodOffset=thickness*2+2+smoothRod/2;	// how far the centre of the z smooth rods are from the frame