$fn=30;
use <../vertex.scad>
//#translate([-26.475,-22.575,0])import (file = "V-slot 2020_fullscale.dxf");
//translate([30,0,-15])import("v-slot_endcap_2020.stl");

extrusion = 20;


module Extrusion(height = 10, cut_d=4.5, cut_w=5.5, extra = .25){
	cut_d = cut_d-extra;
	cut_w = cut_w-extra;
	difference(){
		translate([-extrusion/2,-extrusion/2,0]) cube([extrusion,extrusion,height]);

		for(i = [0:3]){
			rotate([0,0,90*i]){
				translate([extrusion/2-cut_d,-cut_w/2,-1])cube([cut_d,cut_w,height+2]);
				translate([0,5.375+extra,-1])rotate([0,0,45])cube([10,10,height+2]);
			}
		}
	}
	for(i=[0:3]){
	rotate([0,0,90*i]){
	//translate([extrusion/2,extrusion/2,-1])cylinder(r=1, h=height+2);
	}
	}
}
module wheel(){
translate([-5.12,0,0])
rotate([0,90,0]){
cylinder(r1=9.77, r2=24.39/2, h=5.12/2);
translate([0,0,5.12/2])cylinder(r1=24.39/2, r2=9.77, h=5.12/2);
translate([0,0,5.12])cylinder(r1=9.77, r2=24.39/2, h=5.12/2);
translate([0,0,5.12/2*3])cylinder(r1=24.39/2, r2=9.77, h=5.12/2);
}
}
module corner(brc_d, brc_h){
intersection(){
cylinder(r=brc_d, h = brc_h);
translate([0,-brc_d,0])cube([brc_d,brc_d*2,brc_h]);
rotate([0,0,60])translate([0,-brc_d,0])cube([brc_d,brc_d*2,brc_h]);
}
}


translate([0,-20,10])wheel();
translate([0,20,10])wheel();
Extrusion(height = 50);


module brace(){
sin60 = 0.86602540378443864676372317075294;
cos60 = (1/2);

brc_w = 65;
brc_h = 30;
brc_d = 15;
brc_wng = 35;
brc_wing_off_x = -13;
brc_wing_off_y = 16;
sheet_thick = 10;
brc_wing_pos_x = (brc_w/2+brc_d/2+.79-sheet_thick)*cos60+brc_wing_off_x;
brc_wing_pos_y = (brc_w/2+brc_d/2+.79-sheet_thick)*sin60+brc_wing_off_y;



difference(){
union(){
translate([10,-brc_w/2,0])cube([brc_d,brc_w,brc_h]);
			   translate([10,brc_w/2,0])rotate([0,0,60])cube([brc_d,brc_wng,brc_h]);
mirror([0,1,0])translate([10,brc_w/2,0])rotate([0,0,60])cube([brc_d,brc_wng,brc_h]);
translate([10,brc_w/2,0])
corner(brc_d,brc_h);
mirror([0,1,0])
translate([10,brc_w/2,0])
corner(brc_d,brc_h);

}
			  #translate([brc_wing_pos_x,brc_wing_pos_y,-1])rotate([0,0,60])cube([brc_d,brc_wng,brc_h+2]);
#mirror([0,1,0])translate([brc_wing_pos_x,brc_wing_pos_y,-1])rotate([0,0,60])cube([brc_d,brc_wng,brc_h+2]);
}
}

brace();