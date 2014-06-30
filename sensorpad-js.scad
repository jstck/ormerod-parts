// X-axis homing target for dc42's modulated IR

$fn=25;
thickness = 2;


difference() {
	union() {
		translate([25,12,0]) roundedRect([43,9,thickness], 3);

		translate([8.5,7,0]) roundedRect([10,7,thickness], 3);

		translate([15,2,0]) cube([10,10,thickness]); //Filler, lower part
		translate([40,12-thickness,thickness]) cube([8,thickness*2,15]); //Arm
//       	translate([44,2,thickness]) cube([thickness,10-thickness,15]); //Arm support
		translate([5,5,thickness]) cylinder(h=1,r=3);
		translate([5,15,thickness]) cylinder(h=1,r=3);
	}
	translate([5,5,-1]) cylinder(h=thickness+3,r=1.7);
	translate([5,15,-1]) cylinder(h=thickness+3,r=1.7);
	translate([15,8,-1]) cube([8.5,6,thickness+2]); //Square hole
//	translate([44-1,0,9]) rotate([45,0,0]) cube([thickness+2,12,12]);  //Arm bevel
//	translate([53,-4,-1]) rotate([0,0,45]) cube([10,10,thickness+2]); //Outer bevel

	translate([36,2,-1]) roundedRect([40,6,thickness+2],3);


		translate([20,-4,-1]) rotate([0,0,8]) cube([30,10,thickness+2]);
	
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