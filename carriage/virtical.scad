#import("vertical_carriage_base.stl");


wheel_radius = 9.77;

rail_width = 20;

extra_width= 5;
carriage_h = 10;
carriage_w = rail_width+2*wheel_radius+extra_width;
carriage_d = 60;
rad = carriage_w/2;

difference(){
	translate([-carriage_w/2,-carriage_d/2+10,0]) cube([carriage_w,carriage_d,carriage_h]);
	translate([0,carriage_d/2+10-rad,0])fillet(rad, carriage_h+1);
	mirror(0,0,1)translate([0,carriage_d/2+10-rad,0])fillet(rad, carriage_h+1);
	translate([0,0,-1])cylinder(h=carriage_h+2,r=10);
}

module fillet(rad,ht){
	difference(){
		translate([.5,.5,-.5]) cube([rad,rad,ht]);
		translate([0,0,-1]) cylinder(h=ht+2, r=rad, $fn=100);
	}
}

