// PRUSA iteration3
// X carriage
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <configuration.scad>
use <x_carriage_adapter.scad>
use <inc/bearing.scad>
//use <hardware.scad>
//use <falestruder/miniExtruderFALA3.scad>
//use <falestruder/jhead.scad>
module x_carriage_base(){
 // Small bearing holder
 translate([-33/2,+2,0]) rotate([0,0,90]) horizontal_bearing_base(2);
 hull(){
     // Long bearing holder
     translate([-33/2,x_rod_distance+2,0]) rotate([0,0,90]) horizontal_bearing_base(2);
     // Belt holder base
     translate([-36,20,0]) cube([39,16,17]);
    }
     // Base plate
translate([-26.5,59,0]) cube([20,10,6]); //--Add 3Dita supporti x-carriage-adapter-mono
 translate([-58.5,14,0]) cube([80+4.1,18,4.5+1.5]);
 translate([-58.5,51,0]) cube([80+4.1,10.5,4.5+1.5]);
 //translate([-38,-35,-16]) cube([16,64,16]); ////--Add 3Dita
}




module x_carriage_beltcut(){
 // Cut in the middle for belt
 translate([-2.3-16.5+1,19,7]) cube([2.5,13,15]);
 // Cut clearing space for the belt
 translate([-50,6,7]) cube([70,14,15]);
 // Belt slit
 translate([-50,21.5+10,6]) cube([67,1,15]);
 // Smooth entrance
 translate([-56,21.5+10,14]) rotate([45,0,0]) cube([67,15,15]);
 // Teeth cuts
 for ( i = [0 : 33] ){
   translate([25-i*belt_tooth_distance,21.5+8,6+1.5]) cube([1.7,3,15]);
 }
}

module x_carriage_holes(){
 // Small bearing holder holes cutter
  translate([-33/2,2,0]) rotate([0,0,90]) horizontal_bearing_holes(2);
 // Long bearing holder holes cutter
  translate([-33/2,x_rod_distance+2,0]) rotate([0,0,90]) horizontal_bearing_holes(2);
  // Extruder mounting holes
translate([-1.2,0,0]) rotate([0,0,0])
		{
  translate([-26.9+17,25,-1]) rotate([0,0,90]) cylinder(r=1.7, h=20, $fn=32);
  translate([-26.9+17,25,10]) rotate([0,0,90]) cylinder(r=3.3, h=20, $fn=6); 
  translate([-3.7-17,25,-1]) rotate([0,0,90]) cylinder(r=1.7, h=20, $fn=32);
  translate([-3.7-17,25,10]) rotate([0,0,90]) cylinder(r=3.3, h=20, $fn=6); 	
		}
  translate([-30+8,64.5,3.3]) cylinder(r=1.7, h=3, $fn=32);  					 //--Add 3Dita  x-carriage-adapter-mono
  translate([-30+8,64.5,0]) rotate([0,0,90]) cylinder(r=3.3, h=3.2, $fn=6);     //--Add 3Dita x-carriage-adapter-mono

  translate([-30+19,64.5,3.3]) cylinder(r=1.7, h=3, $fn=32);  					 //--Add 3Dita  x-carriage-adapter-mono
  translate([-30+19,64.5,0]) rotate([0,0,90]) cylinder(r=3.3, h=3.2, $fn=6);     //--Add 3Dita x-carriage-adapter-mono


  translate([-70+17,25,-1]) cylinder(r=1.7, h=20, $fn=32);  					  //--Add 3Dita
  //translate([-70+17,25,3]) rotate([0,0,90]) cylinder(r=3.3, h=3.2, $fn=6);     //--Add 3Dita
  translate([37-17,25,-1])cylinder(r=1.7, h=20, $fn=32);   					//--Add 3Dita
  //translate([37-17,25,3]) rotate([0,0,90]) cylinder(r=3.3, h=3.2, $fn=6);    //--Add 3Dita

  translate([-70+17,56,-1]) cylinder(r=1.7, h=20, $fn=32);  					 //--Add 3Dita
  //translate([-70+17,56,3]) rotate([0,0,90]) cylinder(r=3.3, h=3.2, $fn=6);     //--Add 3Dita
  translate([37-17,56,-1])cylinder(r=1.7, h=20, $fn=32);   					//--Add 3Dita
  //translate([37-17,56,3]) rotate([0,0,90]) cylinder(r=3.3, h=3.2, $fn=6);    //--Add 3Dita
}

module x_carriage_fancy(){
 // Top right corner
 translate([12.5,-48,0]) translate([0,45+11.5,-1]) rotate([0,0,0]) translate([0,-15,0]) cube([30,26,20]);
 // Bottom right corner
 translate([9.5,5,0]) translate([0,-11.5,-1]) rotate([0,0,-45]) translate([0,-15,0]) cube([30,30,20]);
 // Bottom ĺeft corner
 translate([-42.5,5,0]) translate([0,-11.5,-1]) rotate([0,0,-135]) translate([0,-15,0]) cube([30,30,20]);
 // Top left corner
 translate([-47-13.5,-37,0]) translate([0,45+11.5,-1]) rotate([0,0,0]) translate([0,-15,0]) cube([15,15,10]);	
}

// Final part
module x_carriage(){
 difference(){
  x_carriage_base();
  x_carriage_beltcut();
  x_carriage_holes();
  x_carriage_fancy();
 }
}
//
x_carriage();
//mono esxtruder adaptor
//translate([-15.5,56.5,-27.5]) rotate([0,90,0]) x_carriage_adapter() ;   ////--Add 3Dita
//translate([-26.5,56.5,-27.5]) rotate([0,90,0]) x_carriage_adapter() ;   ////--Add 3Dita

//dual extruder
//translate([-0.5,6.5,0]){
//	translate([0,0,0]) rotate([0,0,0])
//		{
//		translate([-16,55,0]) rotate([180,0,0]) nema17();
//		translate([5,35,-36]) rotate([0,180,0]) falestruder();
//		translate([10.8,12,-44]) rotate([90,0,0]) hotend_jhead();
//		}
//translate([-58,55,0]) rotate([180,0,0]) nema17();
//translate([-37,35,-36]) mirror([ 0, 0, 1 ]) rotate([0,360,0]) falestruder();
//translate([-42.8,12,-44]) rotate([90,0,0]) hotend_jhead();
//}