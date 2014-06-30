//shaft_height: 42mm;

//Dial indicator sizes
shaft_diameter=8;
housing_diameter=53;
housing_clearance=15;

//Distance from back of housing to center of shaft
shaft_offset=9;

//Size of "nozzle mount block" (adapted from original nozzle mount)
block_width=40;
//block_height=16;
block_height=12;
block_depth=housing_clearance;

//Hole center distance from nozzle mount
offset_y=9;

//Center of mounting hole, distance below top surface
mount_hole_offset_z=7;

//Distance (cc) between mounting holes
mount_hole_distance=15;

mount_hole_diameter=3;
mount_head_diameter=6; //Fits cap head screws
mount_head_depth=4.55; //Depth of screw thread through block

//Extra height to cover for housing cutout
cutout_cutout = 2;
cutout_height=housing_diameter/2-sqrt(housing_diameter*housing_diameter-block_width*block_width)/2-cutout_cutout;

$fn=36;

//Print on its back (surface facing x-carriage)
rotate([90,0,0])
difference()
{
	//The block
	translate([-block_width/2,0,0]) cube([block_width,block_depth,block_height+cutout_height]);

	//Hole for indicator shaft
	translate([0, shaft_offset, -1]) cylinder(r=shaft_diameter/2, h=block_height+2);

	//Mounting holes
	for(side=[-1,1])
	{
		translate([side*mount_hole_distance/2, 0, block_height-mount_hole_offset_z])
			rotate([270,0,0])
			{
				//Screw holes
				translate([0,0,-1]) cylinder(r=mount_hole_diameter/2,h=block_depth+2);

				//Countersink heads
				translate([0,0,mount_head_depth]) cylinder(r=mount_head_diameter/2,block_depth);
			}
	}

	//Cutout for housing
	translate([0, -1, block_height+housing_diameter/2]) rotate([270,0,0]) cylinder(r=housing_diameter/2,h=block_depth+2);
}
