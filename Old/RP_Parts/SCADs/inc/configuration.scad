// Copyright (C) 2012 t00tie
// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/

//==========================================================================//
// Configuration file for Adapto OpenSCAD files                             //
// Scroll past the definition section to change basic and advanced settings //
//==========================================================================//

//====================//
// Definition Section //
//====================//
// Frame and Walls
// frameX and frameY are the dimensions of the frame material when viewed on end(the end of an extrusion looks roughly like an X)
// frameX is the width of the frame material
// frameY is the height of the frame material
//   x
//  [ ]y
// these are used to find offsets for screw placing so screws meet the (slot in the) middle of the frame
frameX=20;// width of the frame material(alu, wood etc.)
frameY=20;// height of the frame material

// Print the hole_calibration.scad object to dial in the next 6 settings
// Google found http://www.fairburyfastener.com/xdims_metric_nuts.htm
M8=8.4;// diameter of M8 threaded rod
M5=5.3;// diameter of M5 threaded rod
M3=3.4;// diameter of M3 threaded rod
M8nut=13;// diameter of M8 nut flat to flat
M5nut=8;// diameter of M5 nut flat to flat
M3nut=5.6;// diameter of M3 nut flat to flat

M8nutThickness=6.8;// thickness of a standard M8 nut(nylock is 8mm)
M5nutThickness=4.7;// thickness of a standard M5 nut(nylock is 5mm)
M3nutThickness=2.4;// thickness of a standard M3 nut

// Acme Linear Screw and Nut
ACME14=6.5;// diameter of 1/4 inch ACME threaded rod in mm
ACME14nut=12.8;// diameter of ACME 1/4 inch nut flat to flat in mm
ACME14nutThickness=6.5;// thickness of ACME 1/4 inch nut in mm

// Linear Bearings
// lm__uu is IDxODxL
lm8uu=[8, 15, 24];
lm10uu=[10, 19, 29];
lm10luu=[10, 19, 55];
lm12uu=[12, 21, 30];

//rotary bearings
// 608__ is IDxODxL
608zz=[8, 22, 7];
rotaryBearing=608zz;// for readability(can be changed if other bearings are used

//====================//
// Basic Config Items //
//====================//
smoothRod=10;			// diameter of smooth rods in mm
linearBearing=lm10uu;	// change this to the linear bearing you are using from the definitions section
zRod=ACME14;			// change this to the z threaded rod you are using from the definitions section
zRodnut=ACME14nut;		// change this to the z nut you are using from the definitions section
zRodnutThickness=ACME14nutThickness;	// change this to the z nut thickness you are using from the definitions section

//=======================//
// Advanced Config Items //
//=======================//
$fn=200;				// default resolution for parts, decrease if part compiling or stl/gcode is unmanageable
xRodDistance=70;		// i3 xaxis_rod_distance=45, try this for compatible extruders, ymmv(not fully parametric yet)
thickness=5;			// thickness of walls etc. in parts