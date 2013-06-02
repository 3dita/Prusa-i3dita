
module x_carriage_adapter(){
difference(){
		union(){
			translate([-4.5,0,4.5]) cube([55,57,9],center=true);
			translate([-22.5,-32,4.5]) rotate([0,0,0]) cube([10,12,9],center=true);
			translate([-40.5,3,0]) rotate([0,0,0]) cube([19,25,9]);
		}
			translate([-19,37.5,0]) rotate([0,0,134]) cube([17.5,39.5,9]);
			translate([-33.5,-28.9,0]) rotate([0,0,0]) cube([6,41.5,9]);
			//translate([-62.5,10,-0.1]) cube([35,50,16]);
			rotate([0,0,1]) translate([-4.5,1.5,8]) cube([42.65,42.65,16],center=true);
			rotate([0,0,15]) translate([-4.5,-35.5,8]) cube([70,10,16],center=true);
			rotate([0,90,0]) translate([-4.5,10,16.6]) 
					{
						cylinder(r=1.5,h=8,$fn=6);
						cylinder(r=3.15,h=3,$fn=6);
					}
			rotate([0,90,0]) translate([-4.5,-10,16.9]) 
					{
						cylinder(r=1.5,h=7,$fn=6);
						cylinder(r=3.15,h=3,$fn=6);
					}

			
			rotate([0,90,0]) translate([-4.5,8,0]) 
					{
						translate([0,0,-48]) cylinder(r=1.5,h=19,$fn=6);
						translate([0,0,-43.4]) cylinder(r=3.15,h=5,$fn=6);
						//translate([0,0,15]) cube([10,8,16],center=true);
						
					}
			rotate([0,90,0]) translate([-4.5,-31.5,0]) //parte sinistra
					{
						translate([0,0,-28]) cylinder(r=1.5,h=39,$fn=6); //foro basso
						translate([0,0,-22.4]) cylinder(r=3.15,h=5,$fn=6); 
					}



	}
}

x_carriage_adapter();