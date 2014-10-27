nema_17_w = 42.3;
nema_17_h = 25;
nema_17_bracket_h = 5.25;
nema_17_hole_space = 31;
nema_17_edge_offset = nema_17_w - (nema_17_w-nema_17_hole_space)/2;
nema_17_offset = 21.9203;
nema_17_lip_r = 22;
nema_17_lip_h = 2.75;

circular_housing = 35;
circ_housing_r = circular_housing/2;
circ_housing_h = 20;

gear_hob_d = 7;
gear_od = 9;
gear_housing = gear_od+1;

m3_major = 6.25;
m3_minor = 3.5;
m3_major_d = 3.25;

filament_w = .4;
$fn=40;

bearing_housing_d = 16;
bearing_offset = (bearing_housing_d+gear_od)/2;



difference(){
	union(){
		difference(){
			translate([-nema_17_w/2,-nema_17_w/2,0]) cube([nema_17_w,nema_17_w, nema_17_bracket_h]);
			rotate([0,0,45])translate([-nema_17_w,gear_hob_d,-.5])cube([nema_17_w*2,nema_17_w, nema_17_bracket_h+1]);

			translate([0,-nema_17_edge_offset,-.5])rotate([0,0,45])translate([15,-10,0])cube([20,10,nema_17_bracket_h+1]);
			mirror([0,1,0])translate([0,-nema_17_edge_offset,-.5])rotate([0,0,45])translate([15,-10,0])cube([20,10,nema_17_bracket_h+1]);
			mirror([1,0,0])translate([0,-nema_17_edge_offset,-.5])rotate([0,0,45])translate([15,-10,0])cube([20,10,nema_17_bracket_h+1]);

			for ( i = [0 : 2] )
			{
				rotate( i * 360 / 4+180-45, [0, 0, 1]){
					translate([0, nema_17_offset, -1])
					cylinder(r=m3_minor/2, h=nema_17_bracket_h+2, $fn=20);
					translate([0,nema_17_offset,nema_17_bracket_h-m3_major_d])
					cylinder(r=m3_major/2,h=m3_major_d+.5,$fn=20);
				}
			}
		}
		
		cylinder(r=circ_housing_r,h=circ_housing_h, $fn=100);
		
		rotate([0,0,45])translate([0,bearing_offset,0])cylinder(r=bearing_housing_d/2,h=circ_housing_h);
	}
translate([0,0,-.5])cylinder(r=gear_housing/2, h=circ_housing_h+1);

difference(){
translate([0,0,-.5])cylinder(r=nema_17_lip_r/2,h=nema_17_lip_h );
translate([0,0,0])cylinder(r=(gear_housing/2)+filament_w, h=circ_housing_h+1);
}

rotate([0,0,45])translate([0,bearing_offset,-.5])cylinder(r=m3_minor/2,h= circ_housing_h+1);
rotate([-45,90,0])translate([-13,bearing_offset/2-1,-20]) #cylinder(r=1,h=40);
}