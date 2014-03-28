// Fala Extruder
// FUM 3mm
// GNU GPL v3
// Giacomo Falaschi <superfala@gmail.com> 
// http://github.com/3dita/Prusa-i3dita
// http://3dita.falaschi.com

use <../library.scad>;
use <../gears.scad>;
use <../fan_holder_v2.scad>;
include <../config.scad>

module falestruder(){

/* Modified by AB to move drive axis 1mm right + 1mm down, and idler 1mm down */
a_mods=true; // Set false for JMG's original
drive_offset_y=15; // Set to 17 for JMG's original, 16 for AB's
full_block=true;  // Set false for M5 nut retainer block, true for actual drive block

$fn=64;
filament_d=3.15+0.4;
filament_offset_x=(5/2+filament_d/2+1.5);//2.5
echo(filament_offset_x);
bite=-1.0;

da8=sqrt(2+sqrt(2))/4;
echo(da8);

//3DAndy
withSupport = true;

//NEMA14();
mirror([1,0,0]) drive_block();
//translate([0,0,25.5]) rotate([0,180,0]) small_gear(); // Assembly position
//translate([28,2,11.5]) rotate([0,180,0]) small_gear(); // Print position

//translate([-(filament_offset_x+filament_d/2+5.6/2-bite-0.5),drive_offset_y+1.5,22.5])  large_gear();// Assembly position 
//translate([33,43,7])rotate([180,0,0]) large_gear(); // Print position

//echo("gear sep",sqrt(pow(filament_offset_x+filament_d/2+5.6/2-bite,2)+pow(drive_offset_y,2)));

module drive_block(){
	difference(){
		union(){
			translate([-1.505,5.5,9.5]) cube([39,50,19],center=true);
			translate([-32.785,-39,0]) cube([26,19.7,19]);     //3dita aggiunta quadrato su uscita filamento
			//translate([-15.5,-34,0]) cube([43,17,12]);     //3dita aggiunta quadrato su uscita filamento x viti estrusore
			translate([17,24,3]) rotate([0,-90,0])
			{
				cylinder(r=3,h=40);
				translate([-3,0,0]) cube([3,3,40]);
			}
			//boss for carriage mount hole
			rotate([0,0,0]) translate([17,-19.5,0]) rotate([0,0,0]) cube([3,7,19]); //3dita aggiunta io
			//boss for idler tensioner hole
			//translate([29,30.4,14.6]) rotate([0,-90,-45]) cylinder(r=5.31,h=29.65);
			//translate([21,24.4,3.6]) rotate([0,-90,-45]) cylinder(r=5.31,h=25.65);
			//translate([21,24.4,8.6]) rotate([0,-90,-45]) cylinder(r=5.31,h=25.65);
			translate([23,27.3,0]) rotate([0,-90,45]) cube([19,25,10.65]);
			translate([26.9,28.3,0]) rotate([0,-90,45]) cube([19,25,10.65]);
			//===========
			translate([filament_offset_x+filament_d/2+6.9/2-bite,drive_offset_y-0.7,0]) cylinder(r=10.65,h=21);
			translate([-7.5,5,0]) cube([25.4,26.2,19]); //==========cubo dei cuscinetti
			rotate([0,0,45]) translate([7.5,5,0])  cube([25.4,26.2,19]);
			translate([-9,25,0]) cube([15,6,14]);
			
		}

		if(full_block)
		{
			//****idler****
			translate([filament_offset_x-filament_d/2-6.5,drive_offset_y+10,6.6]) {
				rotate([0,0,22.5]) translate([3.8,0.2,0]) cylinder(r=7.5,h=6); // ilder di contrasto 8.5
//3DAndy - begin
				rotate([0,0,22.5]) translate([3.8,0.2,0]) cylinder(r=2,h=55,center=true); // foro ilder di contrasto
				//rotate([0,0-4,0]) cylinder(r=2,h=25,center=true); // foro ilder di contrasto
				//translate([0,0,-3.75]) rotate([0,0,90]) cylinder(r=3+0.5,h=2.5+0.5,center=true,$fn=6);  // screw head
//3DAndy - end
				translate([-6,5.5,3]) rotate([0,0,-30]) cube([29,15,6],center=true);
				translate([4,0,3]) rotate([0,0,-45]) cube([32,12,6],center=true);
				//translate([0,0,3]) rotate([0,0,-40]) cube([80,3,6],center=true);

//aggiunto io
translate([-19.6,-7.2,2.4]) difference(){
					if(a_mods)
					{
						translate([2.5,14,4.5])
							cube([16.5,27.6,13.8],center=true);
					}}

translate([-19.6,-7.2,2.4]) difference(){
					if(a_mods)
					{
						translate([2.5,24,2.4])
							cube([16.5,27.6,29.8],center=true);
					}}


translate([-16.6,-21.07,2.4]) rotate([0,0,67]) difference(){
					if(a_mods)
					{
						translate([32,12,4.5]) rotate([0,0,2])
							cube([54.9,27.6,13.8],center=true);

						//translate([32,12,4.5]) rotate([0,0,2])
						//	cube([97.9,27.6,13.8],center=true);

						translate([35,-2,-6.5]) rotate([0,0,2])
							cube([59.9,1,40.8],center=true);

						translate([34.5,5,-6.5]) rotate([0,0,2])
							cube([39.9,14,40.8],center=true);

						translate([58.5,5,-6.5]) rotate([0,0,1])
							cube([19.9,64,40.8],center=true);

						translate([23,-0.3,-6.5]) rotate([0,0,7.2])
							cube([15.9,1,13.8],center=true);

						translate([23,1,-6.5]) rotate([0,0,18])
							cube([13.9,1,13.8],center=true);

						translate([25,0.8,-6.5]) rotate([0,0,14])
							cube([14.9,1.5,13.8],center=true);

						translate([26,-0.4,-6.5]) rotate([0,0,7.1])
							cube([6.9,1.5,13.8],center=true);

						translate([-32,15.87,4.5]) rotate([0,0,-67])
							cube([50.4,87.6,43.8],center=true);

					//alette raffreddatrici

						translate([0.5,-8,7.6]) rotate([0,0,112])
							cube([1.6,7.6,10.8],center=true);

						translate([-3.5,-7.5,7.6]) rotate([0,0,106])
							$cube([1.6,7.6,10.8],center=true);

						translate([-5,-6.3,7.6]) rotate([0,0,118])
							cube([1.6,6.5,10.8],center=true);

						translate([-9.2,-7,7.6]) rotate([0,0,111])
							$cube([1.6,6.2,10.8],center=true);

						translate([-9.8,-5.6,7.6]) rotate([0,0,125])
							cube([1.6,6.2,10.8],center=true);

						translate([-13.8,-6.3,7.6]) rotate([0,0,111])
							$cube([1.6,6.2,10.8],center=true);

						translate([-15.3,-6.2,7.6]) rotate([0,0,135])
							cube([1.6,6.2,10.8],center=true);

						translate([-18.5,-6,7.6]) rotate([0,0,111])
							$cube([1.6,6.2,10.8],center=true);

						//alette uscita aria
					
						translate([-1,-2.2,8.6]) rotate([0,0,-186])
							cube([7.8,10.6,10.8],center=true);

						translate([-2.9,-2.7,8.6]) rotate([0,0,-199])
							cube([2.8,7.6,10.8],center=true);

						translate([-5.25,-2.4,8.6]) rotate([0,0,-190])
							cube([4.8,7.9,10.8],center=true);

						translate([-7.85,-2.1,8.6]) rotate([0,0,-190])
							cube([2.8,7.6,10.8],center=true);

						translate([-9.9,-0.91,8.6]) rotate([0,0,-190])
							cube([2.8,10.3,10.8],center=true);

						translate([-12.3,-1.71,8.6]) rotate([0,0,-189])
							cube([2.8,8.7,10.8],center=true);

						translate([-14.62,-1.55,8.6]) rotate([0,0,-189])
							cube([2.8,7.6,10.8],center=true);

						



					}}


				translate([-20.5,-18,2.4]) difference(){
					if(a_mods)
					{
						translate([-2,5.5,0])
							cube([8,60,25],center=true);
						
					}}
					
					
					

//fine ggiunto io

				translate([-15,12.5,2.4]) difference(){
					if(a_mods)
					{
						translate([8,6,0])
							cube([4,30,35],center=true);
						translate([7.5,6,-15])
							cube([5,30,35],center=true);
					} else
					{
						cube([20,18,15],center=true);
					}
					translate([10-3,-6,-30]) difference(){
						translate([3,-3,0]) cube([6,6,15],center=true);
						cylinder(r=3,h=16,center=true);
					}
				}
			}


			translate([filament_offset_x-0.5-3.8-6,0,-0.1]) rotate([0,0,-14]) cube([2,21.12,20]); //fessura tra ilder e filo
			//translate([filament_offset_x-0.5-3.8-6,0,-0.1]) rotate([0,0,-16]) cube([2,22,20]);
			translate([filament_offset_x-0.5-3.8-0.9,20.5,-0.1]) rotate([0,0,-39.5]) cube([2.1,25,21]); //fessura tra ilder e filo
			translate([filament_offset_x-0.5-3.8-0.9,20.5,-0.1]) rotate([0,0,-43.5]) cube([2.1,25,21]);
			translate([filament_offset_x-0.5-3.8-0.9,20.5,-0.1]) rotate([0,0,-37.5]) cube([2.1,25,21]);
			translate([filament_offset_x-0.5-3.8-22.9,42.5,-0.1]) rotate([0,0,-45]) cube([20.1,25,25]);
translate([filament_offset_x-0.5-3.8-22.9,42.5,-0.1]) rotate([0,0,-45]) cube([20.1,25,25]);
			//****drive****
			if(a_mods)
			{
				translate([filament_offset_x+filament_d/2+3.6/2-bite,drive_offset_y+1,2.5])
				{
					translate([0,0,2.9]) cylinder(r=7.27,h=11.05);// +++++++++++++
					translate([0,0,-6]) cylinder(r=5.07,h=30);// +++++++++++++12.85
					//translate([-2.5,-7,-6]) cube([5,14,3.71]);// +++++++++++++
					translate([0,0,0.5]) scale([1.023,1.023,1]) bearing_625(); //scale([1,1,1.1]) scale([1.05,1.05,1])
					//translate([-6,-0.2,12]) cylinder(r=3.3,h=5,center=true); //aggiunta io
					translate([0,0,16]) scale([1.023,1.023,1.01]) bearing_625(); //scale([1,1,2]) scale([1.02,1.02,1])
				}
			} else
			{
				translate([filament_offset_x+filament_d/2+5.6/2-bite,drive_offset_y,2.5])
				{
					translate([0,0,-3]) cylinder(r=8.8/2,h=20);
					translate([0,0,-0.6]) scale([1,1,1.1]) scale([1.03,1.03,1]) bearing_624();
					translate([0,0,14.5]) scale([1,1,2]) scale([1.03,1.03,1]) bearing_624();
				}
			}

			//****centre bore****
			//for small           gear fori e quadrato del motore
			translate([0,0,13.5]) cylinder(r=9.5,h=20);
			translate([0.8,0.8,13.5]) cylinder(r=9.5,h=20);  //============cerchio sfalsato aggiunta io
			translate([-7.8,-12.5,13.5]) cube([27,18,9]);
			translate([-9.3,-12.5,13.5]) cube([28,15,9]); //3dita aggiunta io
			translate([11,-12.5,7.5]) cube([15,18,9]); //3dita aggiunta io
			//translate([-14,-12.5,14.9]) cube([17,33,9]);


			//for motor flange
			translate([0,0,-0.1]) cylinder(r=11.4,h=2.4+0.3);  /// XXX ANDERS!!!
			translate([0.5,0,-0.1]) cylinder(r=11.4,h=2.4+0.3);  // foro grande motore incastro sfalsato
			translate([-10,0,-10]) cube([67,68,10]);

			translate([0,0,-0.1]) cylinder(r=3.5,h=20);
			translate([-1,0,-0.1]) cylinder(r=3.5,h=20);  //3dita aggiunta io
			translate([0.4,0,-0.1]) cylinder(r=3.5,h=20);  //3dita aggiunta io
			
			//****motor mount holes**** //FORI MOTORE
			for(i=[1,-1]){
				translate([15.6,-15.9,-0.1]) rotate([0,0,0]) cylinder(r=3.3*da8,h=20) ;// cube([5,4,20])
				translate([-15.6,-15.9,-0.1]) rotate([0,0,0]) cylinder(r=3.3*da8,h=20) ;// cube([5,4,20])
				translate([-15.6,15.1,-0.1]) rotate([0,0,0]) cylinder(r=3.3*da8,h=20) ;

			//$$$$ Fori M3 hotend
				translate([-13.5,-34.2,-0.1]) rotate([0,0,0]) cylinder(r=3.3*da8,h=20);
				translate([-1.9,-29.2,-0.1]) rotate([0,0,0]) cylinder(r=3.3*da8,h=20);
			//$$$$ Fori M3 hotend laterali-estruder polacco
				//translate([21.8,-27.5,8]) rotate([90,0,0]) cylinder(r=3.3*da8,h=9);
				//translate([-10.2,-27.5,8]) rotate([90,0,0]) cylinder(r=3.3*da8,h=9);
				//translate([-10.2,-27.5,8]) rotate([90,90,0]) cylinder(r=3.15,h=3,$fn=6);
				//translate([21.8,-27.5,8]) rotate([90,90,0]) cylinder(r=3.15,h=3,$fn=6);	
			//$$$$ Fori quadrati sopra laterali
				//translate([18,-28,-0.1]) rotate([0,0,0]) cube([7,8.5,20]);
				//translate([-13,-28,-0.1]) rotate([0,0,0]) cube([7,8.5,20]);
				//translate([-21,-28,12]) rotate([0,0,0]) cube([9,8.5,20]);
				//translate([-24.5,-28,-0.1]) rotate([0,0,0]) cube([9,8.5,20]);





			}
			//****idler tensioner****
			for(i=[0,9.5]){
				translate([22.6,23.5,4.5+i]) rotate([0,-90,-405]){             //fori ilder
					rotate([0,0,30]) cylinder(r=5.8/sqrt(3),h=3,$fn=9);
					rotate([0,0,22.5]) cylinder(r=3.9*da8,h=40);
				}
			}
		} else
			translate([-50,-11,-5])
				cube([100,50,50]);

		//****filament path****
		translate([filament_offset_x-14.5,0,9.5]) rotate([90,0,-38]){		//	translate([filament_offset_x,0,8]) rotate([90,0,0]){
			//cylinder(r=filament_d/2,h=90,center=true);  			//foro filamento
			//barrel counter bore
			
			translate([0,0,11.1]) 
			{
				if(full_block)
				{
//3DAndy				//	cylinder(r=8.3/2,h=6);
//3DAndy				//	cylinder(r=8.3/sqrt(3), h=6, $fn=6);
				} else
					cylinder(r=5.3/2,h=60,center=true);
			}

			
			//foro innestofilo dopo 605
			//translate([0,0,-19.01]) cylinder(r=4/2,h=4.02);
			rotate([0,-12,0]) translate([-5.05,0.5,-22]) cylinder(r2=2.5/2,r1=5.4/2,h=10);
			//translate([0,0,-20]) cylinder(r2=2.5/2,r1=filament_d/2,h=1);
		}
		//translate([17.1,25,2.5]) rotate([0,-90,0]) cube([35,5.8,3],center=true);
		//****carriage mount holes****
		for(i=[1,-1]){
			rotate([90,0,0]) translate([filament_offset_x+i*16+1.5,7.5,14]){
		//		translate([0,0,-4]) rotate([0,0,22.5]) cylinder(r=3.3*da8,h=16);  //3dita aggiunta io
				if(full_block)
				{
				//	rotate([0,0,30]) cylinder(r=5.8/sqrt(3),h=3,$fn=6);  //3dita aggiunta io
				//	translate([-5.8/2,0,0]) cube([5.8,10,3]);			   //3dita aggiunta io
				}
			}
			
		}
mirror([ 1, 0, 0 ]) rotate([0,0,5]) translate([4.75,-3.5,-20.5]) spe2();

//3DAndy - begin
// Tongue retainer 
		 rotate([90,0,0]) translate([filament_offset_x,9.5,0]) 
		{
			translate([-26.785,0,27.1]) cylinder(r=16.5/2,h=13);		//=======grandezza foro j-head
			translate([-26.785,0,12.1]) cylinder(r=3.75/2,h=18);
			//translate([0,0,8.3]) cube([14.8,20,4.7],center=true); //=======grandezza foro uscita e quadrato per dado
			translate([-31.835,-8.3,21]) cube([10.1,17.8,4.15]);

		}

// lower bearing hole with diagonal top 
if (withSupport) {
		translate([filament_offset_x+filament_d/2+3.6/2+0.5-bite,drive_offset_y,2.5])
		{
			translate([0,0,4.1-2.5+0.35]) scale([1,1,1.1]) scale([1.04,1.04,1]) cylinder(r1=5,r2=4,h=1,center=true);
		}
}
//3DAndy - end
	}









// 3DAndy - support begin - mod 
if (withSupport) {rotate([0,0,-42]) translate([-15.6,4.7,0]) {
	translate([-8.4,14.5,6.52]) cube([13.7,0.35,6.1]);	

//translate([-0.5,14.5+1.5,8]) cube([12,0.35,6.1], center=true);
	translate([-8.4,14.5+1.5,6.52]) cube([14,0.35,6.1]);

//translate([-1.9,14.5-1.5,8]) cube([17,0.35,6.1], center=true);
	translate([-7.85,14.5-1.5,6.52]) cube([13.2,0.35,6.1]);
	
//translate([-0.8,14.5+3,8]) cube([14,0.35,6.1], center=true);
	translate([-8.3,14.5+3,6.52]) cube([14.5,0.35,6.1]);

//translate([-1.5,14.5-3,8]) cube([16,0.35,6.1], center=true);
	translate([-7.25,14.5-3,6.52]) cube([12.9,0.35,6.1]);

//translate([-1.4,14.5-4.5,8]) cube([19.5,0.35,6.1], center=true);
	//translate([-9.5,14.5-4.5,6.52]) cube([19.9,0.35,6.1]);

//translate([0,14.5+4.5,8]) cube([14,0.35,6.1], center=true);
	translate([-8.2,14.5+4.5,6.52]) cube([15.4,0.35,6.1]);
	
//translate([0.5,14.5+6,8]) cube([16,0.35,6.1], center=true);
	translate([-6.2,14.5-5.5,6.52]) cube([13.4,0.35,6.1]);

	translate([-6.7,14.5-4.3,6.52]) cube([13.1,0.35,6.1]);}

	//translate([filament_offset_x+filament_d/2+4/2-bite,drive_offset_y,0]) cylinder(r=6.65,h=0.2);
	//translate([filament_offset_x+filament_d/2+5.6/2-bite,drive_offset_y,4.65]) cylinder(r=6.65,h=1)
	//translate([filament_offset_x+filament_d/2+3.6/2+0.5-bite,drive_offset_y,4.6]) cylinder(r=7.85,h=0.6);
	  //translate([filament_offset_x+filament_d/2+3.6/2+0.5-bite,drive_offset_y,2.5])
	translate([0,0,2.3+0.3]) cylinder(r=11.4,h=0.2);
	translate([0,-2.5,2.6/2]) {       /// XXX ANDERS!!!
		difference() {
			cube([20,3,2.6], center=true);       /// XXX ANDERS!!!
			cube([19.2,2,2.6], center=true);       /// XXX ANDERS!!!
		}
		translate([0,5,0]) difference() {
			cube([20,3,2.6], center=true);       /// XXX ANDERS!!!
			cube([19.2,2,2.6], center=true);       /// XXX ANDERS!!!
		}
		translate([0,-5,0]) difference() {
			cube([12,3,2.6], center=true);       /// XXX ANDERS!!!
			cube([11.2,2,2.6], center=true);       /// XXX ANDERS!!!
		}
		translate([0,10,0]) difference() {
			cube([12,3,2.6], center=true);       /// XXX ANDERS!!!
			cube([11.2,2,2.6], center=true);       /// XXX ANDERS!!!
		}

	}

}

// 3DAndy - support end
}
module insert(){
	difference(){
		cylinder(r=5.6/2,h=6,center=true);
		cylinder(r=2.3/2,h=6.2,center=true);
	}
}
}
//mirror([1,0,0]) drive_block();

falestruder();




module spezzone()
{
rotate_extrude(convexity = 10, $fn = 100)
translate([35.3, 9.5, -30])
circle(r = 3.5/2, $fn = 100);
}

//rotate([49,90,0]) translate([-30,12,-38]) cylinder(r1 = 1.9 , r2 = 3.5/2 , $fn= 100, h = 35);

module spe1(){
difference(){
rotate([0,0,35.8]) translate([-26.3,-1,20.5])  spezzone();
rotate([47,90,0]) translate([-30,12.3,-38]) cylinder(r1 = 14.9 , r2 = 14.8 , $fn= 100, h = 35);
rotate([90,90,0]) translate([-30,21,16.5]) cylinder(r = 33.65/2  , $fn= 100, h = 35);
rotate([0,0,35]) translate([-161,-80,28]) cube([160,160,5]);
}}
module spe2(){
union(){
rotate([47.5,90,0]) translate([-30,9.1,-46.8]) cylinder(r1 = 1.9 , r2 = 3.5/2 , $fn= 100, h = 45);
spe1();
}}

//rotate([0,0,2]) translate([5.8,-4,-20.5]) spe2();

//module falaok(){
//difference(){
//falestruder();
//rotate([0,0,3]) translate([-0.8,0,-20.5]) spe2();
//}}
//falaok();

