// Ormerod Duet + Power PCB enclosure

//By John Stäck, john@stack.se 2014-09-23

//Licensed under Creative Commons Attribution Share-alike
//http://creativecommons.org/licenses/by-sa/3.0/


// For mounting the electronics on the back of the printer, with the Duet on top of the power pcb.
// Similar to where it goes on the Ormerod 2, but without the PSU.

//Based on previous works by bobtidey and dc42:
//http://www.thingiverse.com/thing:335437
//http://www.thingiverse.com/thing:441075

//Many of the settings below have been changed. The case is a bit higher to fit connectors under the lid,
//The vents have been removed (don't do too much good on the side, and the other side is wide open), and
//the cutouts for connectors have been enlarged. There is also a round hole on top for a reset button.

//This file still contains some code for the "old" mounts, functions are just not used.
//It also retains the ability for the DueX4 expansion and while it looks ok, it has not been tested (printed) by the author.

//Main customisable options parameters
Enc_X4_stacked=false;			//Set true to accommodate Duet+DuetX4 boards, false for Duet only
Enc_hollowbase=true;			//Set true to cutout base
Enc_wall_cutout=true;			//Set true to cut out cable wall
Enc_extra_width=0.0;			//Amount of extra width to give separate PCB mount, if 0 then like standard
Enc_ventilation=0;				//If non zero set size of ventilation hole size
Enc_ventilation_spacing=10.0;	//Spacing of vent holes, should be > double ventilation size
Enc_basic_inner_height=30.0;	//Inner depth (x) of the enclosure when Enc_X4 is false (18.0 in RRP original)
Enc_X4_separation=6.5;			//Duet and X4 boards are separated by this less one PCB thickness
Enc_5V_cutout=true;			//Enables cutout for 5V connection
Enc_Bed_cutout=true;			//Enables cutout for bed heater/thermistor cables
Enc_Reset_button=true;		//Enables hole for reset button


//PC mount parameters
Enc_X4_standoff=16;				//How far the X4 board stands off from the base
Enc_duet_standoff=(Enc_X4_stacked) ? Enc_X4_standoff+Enc_X4_separation : 2.5;
Enc_standoff_radius=4;
Enc_standoff_radius_X4=3.55;	// increased because if left at 3.5, slic3r tends to generate 2 circles instead of 3

//Main dimensions
Enc_inner_length=125.0;			//Inner length (y) of the enclosure
Enc_innerduet_width=102.0;		//Duet nominal width
Enc_bottomshelf_width=3.0;		//shelf width under PCB
Enc_base=3.0;						//Thickness of base under PCB
Enc_wall=2.5;						//Thickness of the walls
Enc_upperlid_groove = 1.0;		//Grooves in wall for lid
Enc_upperlid_height=3.7;
Enc_upperlock_height=0.5;		//little wedge to retain acrylic
Enc_upperlock_width=5.0;
Enc_lidfoot_length=5.0;
Enc_sidecutout_offset=8.5;		//Where to cutout wall for cable access
Enc_sidecutout_length=106.0;
Enc_top_extra = (Enc_X4_stacked) ? 1.0 : 0.0;	// extra clearance at top for ribbon cable
Enc_inner_height=(Enc_X4_stacked) ? Enc_basic_inner_height+Enc_duet_standoff : Enc_basic_inner_height;
Enc_lid_width=(Enc_extra_width==0) 
	? Enc_innerduet_width+Enc_wall+Enc_upperlid_groove
	: 107.7;						// if not generating lid feet cutouts, slot needs to be longer
Enc_inner_width=Enc_innerduet_width+Enc_extra_width; // Derived real width

//Total outer dimensions
Enc_total_length = Enc_inner_length+Enc_wall*2;
Enc_total_width  = Enc_inner_width+Enc_wall*2;

//Mounting Holes 
Enc_holes_radius=2.25;
Enc_holes_radius_tap=2.0;
Enc_holes_outerradius=4.5;
// Mounting pillars for the X4 board need to be smaller in order to clear the connectors.
// As the mounting holes in them are smaller than 4mm (like early Duet boards), we can use 3mm screws instead.
Enc_holes_radius_tap_X4=1.5;
Enc_holes_countersinkdepth=1.3;
Enc_holes_countersinkradius=4.0;
Enc_holes_offsets=8.0;
Enc_holes_ext_xoffset=5.6;
Enc_holes_ext_yoffset=20.0;
Enc_holes_ext_height = 2.0;
Enc_Extra_holecount=0; //Remove the row of case mounts

//Connectors - wall			Rerap values with wall=3
Enc_Ethernet_y_offset=7.0;		//10.45
Enc_Ethernet_z_offset=0;		//0.0
Enc_Ethernet_width=19.9;		//17.05
Enc_Ethernet_height=15.5;		//20.00
Enc_SD_y_offset=32.5;			//35.00
Enc_SD_width=14.0;				//13.00
Enc_SD_height=8.0;				//2.60
Enc_SD_z_offset=-1.00;			//1.75
Enc_USB_y_offset=48.5;			//50.0
Enc_USB_width=12.0;				//12.50
Enc_USB_height=8.0;				//6.50
Enc_USB_z_offset=-1.0;				//0.0
Enc_Power_y_offset=46.0;		//52.0
Enc_Power_width=18.0;			//12.50
Enc_Power_height=11.0;			//6.00
Enc_Power_z_offset=0;			//3.00
Enc_5V_y_offset=66.0;			//New
Enc_5V_width=12.0;				//New
Enc_5V_height=11.0;				//New
Enc_5V_z_offset=0;			//New

Enc_Bed_y_offset=14.0;			//New
Enc_Bed_width=21.0;				//New
Enc_Bed_height=Enc_Power_height;				//New
Enc_Bed_z_offset=Enc_Power_z_offset;			//New

Enc_Reset_y_offset=75.0;
Enc_Reset_z_offset=11.0;
Enc_Reset_diameter=7.0;


Enc_X4Power_y_offset=26.5;
Enc_X4Power_z_offset=-Enc_Power_height;
Enc_X4Power_term_hole1_y_offset = Enc_X4Power_y_offset+(Enc_Power_width/2)-3.75;
Enc_X4Power_term_hole2_y_offset = Enc_X4Power_y_offset+(Enc_Power_width/2)+3.75;
Enc_X4Power_term_hole_x_offset = Enc_inner_length + Enc_wall - 7.0;
overlap=0.1;

//Settings for Power PCB

//Distances between mounting holes and size of PCB box (measured from STL for original enclosure)
pp_mount_length = 62;
pp_mount_width = 20;
pp_length = 73; //Inner size
pp_width = 41;
pp_height = 20; //Outer height
pp_wall_thickness = 2;
pp_standoff_height= 3; //Distance from (inside) bottom of box to PCB, basically the depth of the square holes
pp_hole=4.5; //M4 bolts for mounting
pcb_enclosure_y_offset = 10; //To allow duet enclosure to clear z runner
enclosure_spacing = 15; //Distance between duet and power-pcb enclosures

//Settings for top mount
topmount_offset_z = 29-4; //Hole distance from edge of z extrusion to hole - height of standoffs (plywood washers) for power pcb
topmount_offset_y = 22; //Distance from edge of duet enclosure to mount position
topmount_offset_x = 0; //Distance from edge of duet enclosure to mount position
topmount_hole = 4.5; //M4
topmount_margin = 2.5; //Material around hole

topmount_hole_offset = Enc_wall+3+topmount_margin; //Hole offset from top edge of case
topmount_width = topmount_hole+topmount_margin+topmount_hole_offset; //Width of tab
topmount_height = topmount_offset_z+topmount_hole/2+topmount_margin; //Total height of tab
topmount_angle=40;  //An angle that seems to work

topmount_tab_thickness = Enc_wall*2; //Thickness of topmount tab with screw hole. Make thicker for strength and screws being too long

$fn=25;
include <MCAD/boxes.scad>;

//include <DuetEncMeasure.scad>;
//translate([0,0,-30]) measure();

module baseBox() {
	difference() {
		//Start with solid rounded box
		translate([Enc_inner_length/2+Enc_wall,(Enc_inner_width+2*Enc_wall+Enc_top_extra)/2-Enc_top_extra,(Enc_inner_height+Enc_base)/2])
			roundedBox([Enc_inner_length+2*Enc_wall,Enc_inner_width+2*Enc_wall+Enc_top_extra,Enc_inner_height+Enc_base], 1, false);
		//Hollow out with another
		translate([Enc_inner_length/2+Enc_wall,(Enc_inner_width+2*Enc_wall+Enc_top_extra)/2-Enc_top_extra,(Enc_inner_height+Enc_base)/2+Enc_base])
			roundedBox([Enc_inner_length,Enc_inner_width+Enc_top_extra,Enc_inner_height+Enc_base], 1, false);
		//Hollow out for top lip
		translate([Enc_wall-Enc_upperlid_groove,-0.1-Enc_top_extra,Enc_base+Enc_inner_height-Enc_upperlid_height])
			cube([Enc_inner_length+2*Enc_upperlid_groove,Enc_lid_width+0.1,Enc_upperlid_height+0.2]);
		//Cut out the base if needed
		if(Enc_hollowbase) {
			translate([Enc_wall+Enc_bottomshelf_width,Enc_wall+Enc_bottomshelf_width,-0.1])
				cube([Enc_inner_length-2*Enc_bottomshelf_width,Enc_innerduet_width-2*Enc_bottomshelf_width,Enc_base+0.2]);
		}
		//Cut out side for cable entry
		if(Enc_wall_cutout) {
			translate([Enc_wall+Enc_sidecutout_offset,Enc_inner_width,Enc_base])
				cube([Enc_sidecutout_length,3*Enc_wall,Enc_inner_height+0.2]);
		}
		//Cut outs for connectors
		connectorCutouts();
		if(Enc_ventilation>0) {
			if(Enc_wall_cutout) {
				ventilation(0);
			} else {
				ventilation(Enc_inner_width);
			}
		}
		if(Enc_extra_width==0) {
			//Lid feet cutouts
			lidFeetCutouts();
		}
	}

	// Add lidLocks and mounting stands
	lidLocks();
	mountingStands();
}

//mounting hole xpos, ypos, countersink,tap(smaller hole)
module mountingHole(x,y,ht,cs,t,ex) {
	zoffset = (ht+ex>=7) ? ht+ex-7 : -0.05;	// make holes no more than 7mm deep
	translate([x,y,zoffset]) {
		if(t) {
			cylinder(r=Enc_holes_radius_tap,h=ht+ex+1);
		} else {
			cylinder(r=Enc_holes_radius,h=ht+ex+1);
		}
		if(cs) {
			translate([0,0,ht-Enc_holes_countersinkdepth+0.2])
			cylinder(r1=Enc_holes_radius,r2=Enc_holes_countersinkradius,h=Enc_holes_countersinkdepth);
		}
	}
}

//mounting hole xpos, ypos, countersink,tap(smaller hole)
module mountingHoleX4(x,y,ht,cs,t,ex) {
	translate([x,y,ht+ex-7]) {
		cylinder(r=Enc_holes_radius_tap_X4,h=ht+ex+1);
		if(cs) {
			translate([0,0,ht-Enc_holes_countersinkdepth+0.2])
			cylinder(r1=Enc_holes_radius,r2=Enc_holes_countersinkradius,h=Enc_holes_countersinkdepth);
		}
	}
}

module mountingHoles() {
	//Drill mounting holes including the extras
	//Top PCB positions
	mountingHole(Enc_holes_offsets,Enc_holes_offsets,Enc_base,false,true,Enc_duet_standoff);
	mountingHole(Enc_inner_length+2*Enc_wall-Enc_holes_offsets,Enc_holes_offsets,Enc_base,false,true,Enc_duet_standoff);
	//Bottom PCB positions
	if(Enc_extra_width == 0) {
		mountingHole(Enc_holes_offsets,Enc_inner_width+2*Enc_wall-Enc_holes_offsets,
						Enc_base,false,false,Enc_duet_standoff);
		mountingHole(Enc_inner_length+2*Enc_wall-Enc_holes_offsets,Enc_inner_width+2*Enc_wall-Enc_holes_offsets,
						Enc_base,false,false,Enc_duet_standoff);
	} else {
		mountingHole(Enc_holes_offsets,Enc_innerduet_width+2*Enc_wall-Enc_holes_offsets,
						Enc_base,false,true,Enc_duet_standoff);	
		mountingHole(Enc_inner_length+2*Enc_wall-Enc_holes_offsets,Enc_innerduet_width+2*Enc_wall-Enc_holes_offsets,
						Enc_base,false,true,Enc_duet_standoff);
	}
	if (Enc_X4_stacked) {
		//Mounting holes for X4. The lower holes are 2mm further apart than the upper holes and the holes on the Duet.
		mountingHoleX4(Enc_holes_offsets,Enc_holes_offsets+12.5,Enc_base,false,true,Enc_X4_standoff);
		mountingHoleX4(Enc_inner_length+2*Enc_wall-Enc_holes_offsets,Enc_holes_offsets+12.5,Enc_base,false,true,Enc_X4_standoff);
		mountingHoleX4(Enc_holes_offsets-1,Enc_innerduet_width+2*Enc_wall-Enc_holes_offsets-18.5,
						Enc_base,false,true,Enc_X4_standoff);	
		mountingHoleX4(Enc_inner_length+2*Enc_wall-Enc_holes_offsets+1,Enc_innerduet_width+2*Enc_wall-Enc_holes_offsets-18.5,
						Enc_base,false,true,Enc_X4_standoff);
	}
}

//mounting stand xpos, ypos, angle, mounting, external (hull positioning)
module mountingStand(x,y,ht,a,sth,e) {
	translate([x,y,0]) rotate([0,0,a]) {
		hull(){
			cylinder(r=Enc_holes_outerradius,h=ht);
			translate([-1.5*Enc_holes_outerradius,-1.5*Enc_holes_outerradius*e,0]) cube([1,1,ht]);
			translate([1.5*Enc_holes_outerradius-1,-1.5*Enc_holes_outerradius*e,0]) cube([1,1,ht]);
		}
		if(sth > 0) {
			cylinder(r=Enc_standoff_radius,h=ht+sth);
		}
	}
}

module rectStand(xs,xe,y,w,ht) {
	if (xs > xe) {
		translate([xe,y-w/2,Enc_base-1]) cube([xs-xe,w,ht+1]);
	} else {
		translate([xs,y-w/2,Enc_base-1]) cube([xe-xs,w,ht+1]);
	}
	translate([xe,y,Enc_base-1]) cylinder(r=w/2,h=ht+1);
}

module mountingStands() {
	if (Enc_X4_stacked) {
		//Add stands for Duet board
		rectStand(overlap,Enc_holes_offsets,Enc_holes_offsets,
					2*Enc_standoff_radius,Enc_duet_standoff);
		rectStand(overlap,Enc_holes_offsets,Enc_innerduet_width+2*Enc_wall-Enc_holes_offsets,
					2*Enc_standoff_radius,Enc_duet_standoff);
		rectStand(Enc_inner_length+2*Enc_wall-overlap,Enc_inner_length+2*Enc_wall-Enc_holes_offsets,Enc_holes_offsets,
					2*Enc_standoff_radius,Enc_duet_standoff);
		rectStand(Enc_inner_length+2*Enc_wall-overlap,Enc_inner_length+2*Enc_wall-Enc_holes_offsets,Enc_innerduet_width+2*Enc_wall-Enc_holes_offsets,
					2*Enc_standoff_radius,Enc_duet_standoff);
		//Add stands for X4 board
		rectStand(overlap,Enc_holes_offsets,Enc_holes_offsets+12.5,
					2*Enc_standoff_radius_X4,Enc_X4_standoff);
		rectStand(overlap,Enc_holes_offsets-1,Enc_innerduet_width+2*Enc_wall-Enc_holes_offsets-18.5,
					2*Enc_standoff_radius_X4,Enc_X4_standoff);
		rectStand(Enc_inner_length+2*Enc_wall-overlap,Enc_inner_length+2*Enc_wall-Enc_holes_offsets,Enc_holes_offsets+12.5,
					2*Enc_standoff_radius_X4,Enc_X4_standoff);
		rectStand(Enc_inner_length+2*Enc_wall-overlap,Enc_inner_length+2*Enc_wall-Enc_holes_offsets+1,Enc_innerduet_width+2*Enc_wall-Enc_holes_offsets-18.5,
					2*Enc_standoff_radius_X4,Enc_X4_standoff);
	} else {
		//Add stands for Duet board
		mountingStand(Enc_holes_offsets,Enc_holes_offsets,Enc_base,-45,
							Enc_duet_standoff,0);
		mountingStand(Enc_holes_offsets,Enc_innerduet_width+2*Enc_wall-Enc_holes_offsets,Enc_base,-135,
							Enc_duet_standoff,0);
		mountingStand(Enc_inner_length+2*Enc_wall-Enc_holes_offsets,Enc_holes_offsets,Enc_base,45,
							Enc_duet_standoff,0);
		mountingStand(Enc_inner_length+2*Enc_wall-Enc_holes_offsets,Enc_innerduet_width+2*Enc_wall-Enc_holes_offsets,Enc_base,135,
							Enc_duet_standoff,0);
	}
}

module connectorCutouts() {
	translate([0,Enc_wall,Enc_base+Enc_duet_standoff]) {
		//Ethernet
		translate([-0.1,Enc_Ethernet_y_offset,Enc_Ethernet_z_offset])
			cube([Enc_wall+0.2,Enc_Ethernet_width,Enc_Ethernet_height]);
		//SD
		translate([-0.1,Enc_SD_y_offset,Enc_SD_z_offset])
			cube([Enc_wall+0.2,Enc_SD_width,Enc_SD_height]);
		//USB
		translate([-0.1,Enc_USB_y_offset,Enc_USB_z_offset])
			cube([Enc_wall+0.2,Enc_USB_width,Enc_USB_height]);
		//Power
		translate([Enc_inner_length+Enc_wall-0.1,Enc_Power_y_offset,Enc_Power_z_offset])
			cube([Enc_wall+0.2,Enc_Power_width,Enc_Power_height]);
		if(Enc_5V_cutout) {
			//5V
			translate([Enc_inner_length+Enc_wall-0.1,Enc_5V_y_offset,Enc_5V_z_offset])
				cube([Enc_wall+0.2,Enc_5V_width,Enc_5V_height]);
		}

		if(Enc_Bed_cutout) {
			//Bed heat+thermistor
			translate([Enc_inner_length+Enc_wall-0.1,Enc_Bed_y_offset,Enc_Bed_z_offset])
				cube([Enc_wall+0.2,Enc_Bed_width,Enc_Bed_height]);
		}

		if(Enc_Reset_button) {
			translate([-0.1,Enc_Reset_y_offset,Enc_Reset_z_offset])
				rotate([0,90,0]) cylinder(d=Enc_Reset_diameter,h=Enc_wall+0.2);
		}
	}
	if(Enc_X4_stacked) {
		//X4 power
		translate([Enc_inner_length+Enc_wall-overlap,Enc_X4Power_y_offset+Enc_wall,Enc_X4Power_z_offset+Enc_base+Enc_X4_standoff])
			cube([Enc_wall+2*overlap,Enc_Power_width,Enc_Power_height]);
		translate([Enc_X4Power_term_hole_x_offset,Enc_X4Power_term_hole1_y_offset+Enc_wall,-overlap])
			cylinder(r=2.5,h=Enc_base+2*overlap);
		translate([Enc_X4Power_term_hole_x_offset,Enc_X4Power_term_hole2_y_offset+Enc_wall,-overlap])
			cylinder(r=2.5,h=Enc_base+2*overlap);
	}
}

module lidFeetCutouts() {
	translate([Enc_wall-Enc_upperlid_groove,Enc_inner_width+Enc_wall-0.1,Enc_base+Enc_inner_height-Enc_upperlid_height])
		cube([Enc_lidfoot_length,Enc_wall+0.2,Enc_upperlid_height+0.2]);
	translate([Enc_inner_length+Enc_wall+Enc_upperlid_groove-Enc_lidfoot_length,Enc_inner_width+Enc_wall-0.1,Enc_base+Enc_inner_height-Enc_upperlid_height])
		cube([Enc_lidfoot_length,Enc_wall+0.2,Enc_upperlid_height+0.2]);
}

module ventilation(l) {
	for(x=[Enc_wall+Enc_holes_offsets+Enc_ventilation
			: Enc_ventilation_spacing
			: Enc_inner_length+Enc_wall-Enc_ventilation-Enc_holes_offsets]) {
		for(z=[Enc_base+2*Enc_ventilation
				: Enc_ventilation_spacing
				: Enc_inner_height+Enc_base-Enc_ventilation-Enc_upperlid_height]) {
			translate([x,-overlap-Enc_top_extra,z]) rotate([0,45,0])
				cube([Enc_ventilation,Enc_wall+2*overlap,Enc_ventilation]);
			translate([x,l+Enc_wall-overlap,z]) rotate([0,45,0])
				cube([Enc_ventilation,Enc_wall+2*overlap,Enc_ventilation]);
		}
	}
}

module lidLock(m) {
	mirror([m,0,0]) difference() {
		cube([Enc_upperlock_height,Enc_upperlock_width,Enc_upperlock_height]);
		rotate([0,45,0]) cube([Enc_upperlock_height,Enc_upperlock_width,1.5*Enc_upperlock_height]);
	}
}

module lidLocks() {
	translate([Enc_wall-Enc_upperlid_groove,Enc_wall-Enc_top_extra,Enc_base+Enc_inner_height-Enc_upperlock_height]) lidLock(0);
	translate([Enc_inner_length+Enc_wall+Enc_upperlid_groove,Enc_wall-Enc_top_extra,Enc_base+Enc_inner_height-Enc_upperlock_height]) lidLock(1);
	translate([Enc_wall-Enc_upperlid_groove,Enc_wall+Enc_innerduet_width-Enc_upperlock_width-Enc_top_extra,Enc_base+Enc_inner_height-Enc_upperlock_height]) lidLock(0);
	translate([Enc_inner_length+Enc_wall+Enc_upperlid_groove,Enc_wall+Enc_innerduet_width-Enc_upperlock_width-Enc_top_extra,Enc_base+Enc_inner_height-Enc_upperlock_height]) lidLock(1);
}


module Duet() {
	difference() {
		baseBox();
		mountingHoles();
	}

}





module PowerPCB()
{
	difference()
	{
		//Outer box
		translate([pp_width/2+pp_wall_thickness,pp_length/2+pp_wall_thickness,pp_height/2])
			roundedBox([pp_width+pp_wall_thickness*2,pp_length+pp_wall_thickness*2,pp_height],1,false);

		//Hollow out from standoff height
		translate([pp_wall_thickness,pp_wall_thickness,pp_wall_thickness+pp_standoff_height])
			cube([pp_width,pp_length,pp_height]);

		//Hollow out down to bottom depth, mimic original structure (lines up with stuff on underside of PCB)
		translate([pp_wall_thickness,pp_wall_thickness,pp_wall_thickness])
		{
			translate([2,10.3,0]) cube([16.5,13.8,pp_height]);
			translate([0,26.1,0]) cube([18.5,36.6,pp_height]);
			translate([0,64.7,0]) cube([20.5,8.3,pp_height]);
			translate([18.5,0,0]) cube([22.5,8.3,pp_height]);
			translate([20.5,10.3,0]) cube([20.5,52.4,pp_height]);
		}

		//Mounting holes
		translate([pp_wall_thickness+(pp_width-pp_mount_width)/2,pp_wall_thickness+(pp_length-pp_mount_length)/2,-1])
			cylinder(d=pp_hole,h=pp_height+2);
		translate([pp_wall_thickness+pp_width/2+pp_mount_width/2,pp_wall_thickness+pp_length/2+pp_mount_length/2,-1])
			cylinder(d=pp_hole,h=pp_height+2);

		//Take off top+right corner for cables
		translate([-1,pp_wall_thickness,pp_wall_thickness + pp_standoff_height])
			cube([1+18.5,pp_length+pp_wall_thickness+1,pp_height]);
	}

	//Join with Duet with a few pillars to leave room for cabling
	translate([-enclosure_spacing/2,8/2,(pp_wall_thickness + pp_standoff_height)/2])
		roundedBox([enclosure_spacing+4,8,pp_wall_thickness + pp_standoff_height],1,false);
	translate([-enclosure_spacing/2,33.5,(pp_wall_thickness + pp_standoff_height)/2])
		roundedBox([enclosure_spacing+4,11,pp_wall_thickness + pp_standoff_height],1,false);
	translate([-enclosure_spacing/2,pp_length+pp_wall_thickness*2-10/2,(pp_wall_thickness + pp_standoff_height)/2])
		roundedBox([enclosure_spacing+4,10,pp_wall_thickness + pp_standoff_height],1,false);

	translate([-enclosure_spacing/2,pp_wall_thickness/2,pp_height/2])
		roundedBox([enclosure_spacing+4,pp_wall_thickness,pp_height],1,false);
}

module TopMount()
{
	//Draw roughly where z runner bearing will need clearance (assuming mount is flush with z extrusion)
	*translate([-10,topmount_offset_y-10,-4]) %cube([60,10,4+9]);
	difference()
	{
		union()
		{
			rotate([topmount_angle,0,0]) translate([0,-1,0]) cube([topmount_width,topmount_offset_y*1.5,Enc_base]); //Overhang part
			translate([0,topmount_offset_y-topmount_tab_thickness,0]) cube([topmount_width,topmount_tab_thickness,topmount_height]); //Tab with screw hole
			translate([0,-1,0]) cube([Enc_wall,topmount_offset_y+1,Enc_inner_height+Enc_base-Enc_upperlid_height]); //Sidewall
		}
		//Screw hole
		translate([topmount_hole_offset,topmount_offset_y-topmount_tab_thickness-1,topmount_offset_z]) rotate([-90,0,0])
			cylinder(d=topmount_hole,h=topmount_tab_thickness+2);

		//Cut off anything under z=0
		translate([-1,-10,-10]) cube([20,20,10]);

		//Cut off anything outside mount edge
		translate([-1,topmount_offset_y,-1]) cube([20,10,topmount_offset_z+10]);

		//Cut off stuff below overhang
		rotate([topmount_angle,0,0]) translate([-1,-5,-20]) cube([20,40,20]);
	}
}

module Enclosure()
{
	Duet();
	translate([Enc_total_length+enclosure_spacing,pcb_enclosure_y_offset,0]) PowerPCB();
	translate([topmount_offset_x,Enc_total_width,0]) TopMount();
}


Enclosure();
