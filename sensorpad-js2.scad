// X-axis homing target for dc42's modulated IR

$fn=25;
thickness = 2;


difference() {
	union() {

		//Upper and lower part of "body"		
		translate([25,12,0]) roundedRect([43,9,thickness], 3);
		translate([8.5,7,0]) roundedRect([10,7,thickness], 3);


		//Screw hole extensions
		translate([5,5,thickness]) cylinder(h=1,r=3);
		translate([5,15,thickness]) cylinder(h=1,r=3);


		 //Filler for lower corner lower part
		translate([15,2,0]) cube([10,10,thickness]);

		//Arm
		translate([40,12-thickness,thickness]) cube([8,thickness,22]);

		//Arm support
		translate([48,12,thickness]) rotate([0,-90,0]) linear_extrude(height=8,convexity=2)
			polygon(points=[[0,0],[0,4],[4,0]], paths=[[0,1,2]]);
	}

	//Screw holes
	translate([5,5,-1]) cylinder(h=thickness+3,r=1.7);
	translate([5,15,-1]) cylinder(h=thickness+3,r=1.7);

	//Square hole
	translate([15,8,-1]) cube([8.5,6,thickness+2]);

	//Cutout for lower inner corner
	translate([36,2,-1]) roundedRect([40,6,thickness+2],3);

	//Cutout to make arm more narrow
	translate([20,-4,-1]) rotate([0,0,8]) cube([30,10,50]);
	
}

module roundedRect(size, radius)
{
	x = size[0];
	y = size[1];
	z = size[2];

	linear_extrude(height=z)
	hull()
	{
		// place 4 circles in the corners, with the given radius
		translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
	
		translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
	
		translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
	
		translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
	}
}