//#import("vertical_carriage_base.stl");


wheel_radius = 9.77;
wheel_virt_offset = 5;
carriage_wheel_width = 39;
wheel_offset = carriage_wheel_width/2;
mount_width = 20;
mount_offset = mount_width/2;
mount_virt_offset = 5;

mount_bolt = 3/2;
wheel_bolt = 5/2;
rail_width = 20;

extra_width= 5;
carriage_h = 10;
carriage_w = carriage_wheel_width+2*extra_width;
carriage_d = 60;
rad = carriage_w/2;
carriage_fillet_offset = 10;

internal_width = 30;

difference(){
	union(){
		difference(){
			translate([-carriage_w/2,-carriage_d/2+carriage_fillet_offset,0]) cube([carriage_w,carriage_d,carriage_h]);
			translate([0,carriage_d/2+carriage_fillet_offset-rad,0])fillet(rad, carriage_h+1);
			mirror(0,0,1)translate([0,carriage_d/2+carriage_fillet_offset-rad,0])fillet(rad, carriage_h+1);
			scale([1.5,1.5,1])translate([0,14,-1])cylinder(h=carriage_h+2,r=internal_width/3);
			//scale([1,1.5,1])translate([10,0,-1])cylinder(h=carriage_h+2,r=10);
			translate([wheel_offset,+wheel_virt_offset+2,-1])cylinder(r=wheel_bolt,h=carriage_h+2, $fn = 20);
			translate([-wheel_offset,-wheel_offset+wheel_virt_offset,-1])cylinder(r=wheel_bolt,h=carriage_h+2, $fn = 20);
			translate([-wheel_offset,wheel_offset,-1])cylinder(r=wheel_bolt,h=carriage_h+2, $fn = 20);
			
			translate([-internal_width/2,-internal_width/2+2,-1])cube([internal_width,internal_width+5,carriage_h+2]);
		}
		difference(){
			translate([-internal_width/2,-internal_width/2+2,0])cube([internal_width,internal_width+5,carriage_h]);
			translate([-6,-0,-2])cube([21,27,carriage_h+4]);
		}
	}
	translate([mount_offset,-mount_offset+mount_virt_offset,-1])cylinder(r=mount_bolt,h=carriage_h+2, $fn = 20);
	translate([-mount_offset,-mount_offset+mount_virt_offset,-1])cylinder(r=mount_bolt,h=carriage_h+2, $fn = 20);
	translate([-mount_offset,mount_offset+mount_virt_offset,-1])cylinder(r=mount_bolt,h=carriage_h+2, $fn = 20);

	translate([15,-18,0])
			difference(){
			translate([-.5,-3,-1])cube([15,23,14]);
			translate([2,2,-2])cube([10,19,16]);
		}
		translate([-30,-9,5])rotate([0,90,0])cylinder(r=3.5/2,h=60, $fn=30);
		
	
}

		
module fillet(rad,ht){
	difference(){
		translate([.5,.5,-.5]) cube([rad,rad,ht]);
		translate([0,0,-1]) cylinder(h=ht+2, r=rad, $fn=100);
	}
}

