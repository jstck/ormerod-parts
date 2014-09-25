$fn=36;

//J-head hotend mount for Ormerod. By John Stäck, Copyright (c) 2014.
//Licensed under Creative Commons Attribution Share-Alike (CC BY-SA)

//Dimensions of J-head nozzle holder V.5
diameter = 16; //Diameter of nozzle holder
groove_diameter=12;
groove_width=4.6;
groove_offset=4.8;


block_width=40;
block_height=16;
block_thickness=9.1;
hole_distance=15; //Distance between holes
//hole_offset=7; //Distance from top of block
hole_offset=groove_offset+groove_width/2; //7.1, just to get screw holes centered in groove

hole_diameter=3.5;

rotate([-90,0,0]) //Rotate for printing
difference()
{
	translate([-block_width/2,0,0]) cube([block_width, block_thickness, block_height]);

	//Screw holes
	for(dir=[-1,1]) translate([dir*hole_distance/2, -1, block_height-hole_offset]) rotate([-90,0,0]) cylinder(d=hole_diameter,h=block_thickness+2);

	//"inner cylinder" matching the groove
	translate([0,0,-1]) cylinder(d=groove_diameter, h=block_height+2);

	//Top and bottom parts of thick cylinder
	translate([0,0,block_height-groove_offset]) cylinder(d=diameter, h=groove_offset+1);
	translate([0,0,-1]) cylinder(d=diameter, h=block_height-groove_width-groove_offset+1);

	//cut out a bit along the screw holes, as it's so thin
	translate([-diameter/2,-1,block_height-groove_offset-groove_width-0.1]) cube([diameter, 2.5+1, groove_width+0.2]);
}