/* Printea
 * Copyright (c) 2013 by Falaschi Giacomo [3dita@falaschi.com]
 * Dual-licensed under 
 * Creative Commons Attribution-ShareAlike 3.0 (CC BY-SA) [http://creativecommons.org/licenses/by-sa/3.0/]
 * and
 * GPL v2 or later [http://www.gnu.org/licenses/].
 */

/* necessary libs: /
 */
use <inc/hardware.scad>;
use <inc/LM8UU_holder_ziptie.scad>;




//////////////////////////////
//CARRELLO X
//////////////////////////////


//translate([-39,0,0]) cube([200,200,390],center=true);

module caseesterno(){
	difference(){
				translate([0,0,250]) cube([416,416,380],center=true);
				translate([0,0,250]) cube([364,364,501],center=true);
				translate([0,0,124]) cube([200,310,250],center=true);
				translate([0,0,124]) cube([310,200,250],center=true);
			}
}


module caseesternoForato(){
		difference(){
					caseesterno();
					foricase();
					mirror([0,1,0]) foricase();
}
}

//caseesternoForato();













module forinema17(){
  translate(v=[20,-15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,-15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);


  translate(v=[20,-13.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30); //add 3dita.falaschi.com
  translate(v=[1,-13.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30); //add 3dita.falaschi.com

  translate(v=[-10,-14.5,-15.5]) rotate(a=[0,0,0])  cube(size = [30,2,3.58], center = true);            //add 3dita.falaschi.com
  translate(v=[-4,-14.5,-15.5]) rotate(a=[0,0,0])  cube(size = [10,2,6.17], center = true);  			//add 3dita.falaschi.com

  translate(v=[20,-15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,-15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);



  translate(v=[20,-13.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);  //add 3dita.falaschi.com
  translate(v=[1,-13.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);   //add 3dita.falaschi.com

  translate(v=[-10,-14.5,15.5]) rotate(a=[0,0,0])  cube(size = [30,2,3.58], center = true);       	    //add 3dita.falaschi.com
  translate(v=[-4,-14.5,15.5]) rotate(a=[0,0,0])  cube(size = [10,2,6.17], center = true);  			//add 3dita.falaschi.com

  translate(v=[20,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);



  translate(v=[20,17.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);  //add 3dita.falaschi.com
  translate(v=[1,17.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);   //add 3dita.falaschi.com

  translate(v=[-10,16.5,15.5]) rotate(a=[0,0,0])  cube(size = [30,2,3.58], center = true);                //add 3dita.falaschi.com
  translate(v=[-4,16.5,15.5]) rotate(a=[0,0,0])  cube(size = [10,2,6.17], center = true);  			//add 3dita.falaschi.com
}


module barre(){ 
translate([0,110,258]){
rotate([0,90,0]) translate([0,25,0]) cylinder(r=8/2, h=285, center=true);
translate([0,-245,0]) rotate([0,90,0]) cylinder(r=8/2, h=285, center=true);
}}

barre();

module forim3(){rotate([90,90,0]) {
	  translate([0,0,-10]) cylinder(r=1.7, h=29, $fn=32);  					 
  translate([0,0,9]) rotate([0,0,180]) cylinder(r=3.3, h=3.2, $fn=6);
}}





//module supportiYdownmid()}

//supportiYdownmid();
//translate([87.5,114,288]) rotate([159,0,90]) cube([8.5,13.5,41]);
//translate([122.5,88,288]) rotate([155,0,180]) cube([6,13.5,41]);


module supporticomplete(){

//supportiYdownmid();
{
	difference(){
	translate([77,80,249]) cube([45.5,42.5,45]);
	translate([99,99,258]) cube([17.5,15,26]);
	translate([99,59,248]) cube([23.5,41.01,36]);
	translate([70,70,248]) cube([30,83.5,36]);
	//forinema17()

	translate([80,122,330.01]) rotate([180,0,0]) nema17();
	translate([78.5,122,330.01]) rotate([180,0,0]) nema17();
	translate([77,122,330.01]) rotate([180,0,0]) nema17();
	translate([98,101,278]) rotate([180,90,90]) forinema17();
}


translate([87.5,114,288]) rotate([159,0,90]) cube([8.5,13.5,41]);
translate([122.5,88,288]) rotate([155,0,180]) cube([6,13.5,41]);

}}
//supporticomplete();

module foricase(){
				translate([99,126.1,275]) rotate([0,96,0]) forim3();
		translate([112,126.1,275]) rotate([0,96,0]) forim3();
		translate([128.5,102,275]) rotate([90,90,0]) forim3();
}

module supporticompleteFORI(){
	difference(){
		supporticomplete();
		foricase();
			}
}


// supporti motori
translate([25,25,0]) supporticompleteFORI();
mirror([0,1,0]) translate([25,25,0]) supporticompleteFORI();

module vitozzo5(){
				translate([122.35,-11,278]) cylinder(r=2.5, h=29, $fn=32);  					 
				translate([122.35,-11,278]) rotate([0,0,180]) cylinder(r=5.3, h=3.2, $fn=6);
			  }

//translate([-21.5,90,570]) rotate([180,0,0]) vitozzo5();


module respingenti(){


{
	difference(){
	translate([77,80,249]) cube([45.5,42.5,45]);
	translate([99,99,258]) cube([17.5,15,26]);
	translate([99,59,248]) cube([23.5,41.01,36]);
	translate([70,70,248]) cube([30,83.5,36]);
	//forinema17()

	//translate([80,122,330.01]) rotate([180,0,0]) nema17();
	translate([78.5,122,330.01]) rotate([180,0,0]) nema17();
	//translate([77,122,330.01]) rotate([180,0,0]) nema17();
	translate([98,101,278]) rotate([180,90,90]) forinema17();

}


translate([87.5,114,288]) rotate([159,0,90]) cube([8.5,13.5,41]);
translate([122.5,88,288]) rotate([155,0,180]) cube([6,13.5,41]);

}}



module respingentiridotto(){
difference(){
			respingenti();
			translate([76.5,71,278]) cube([12.5,63.5,41]);
			rotate([0,0,90]) translate([77.35,-131,278]) cube([12.5,63.5,41]);
			rotate([0,0,90]) translate([77.35,-131,290]) cube([62.5,63.5,41]);
			rotate([0,0,45]) translate([122.35,-11,278]) cube([12.5,63.5,41]);
			translate([-22.8,90,568]) rotate([180,0,0]) vitozzo5();
}

}
mirror([1,0,0]) translate([25,25,0]) respingentiridotto();
mirror([1,1,0]) translate([25,25,0]) respingentiridotto();

//rotate([0,0,90]) translate([76.5,71,278]) cube([12.5,63.5,41]);

//////////////////////////////
//CARRELLO Y
//////////////////////////////

module barreY(){
translate([10,0,244]) rotate([90,90,0]) cylinder(r=8/2, h=240, center=true);
translate([48,0,263]) rotate([90,90,0]) cylinder(r=8/2, h=240, center=true);
}

translate([60,0,0]) barreY();

//rotate([0,90,0]) translate([-258,-135,86]) cylinder(r=15.4/2, h=48, center=true);

module motoriestrusore(){
	translate([62.5,-52,293]) rotate([0,90,0]) nema17();
	translate([62.5,-10,293]) rotate([0,90,0]) nema17();
					}
translate([163,0,0]) rotate([0,0,180]) motoriestrusore();

//////// ilder cuscinetti
module arreggicuscinetti()
union(){
rotate([270,0,0]) translate([100.4,-258,-145.8]) LM8UU_holder();
rotate([270,0,0]) translate([73.75,-258,-145.8]) LM8UU_holder();

}
module arreggicuscinettidoppio()
difference(){
			arreggicuscinetti();
			rotate([0,90,0]) translate([-258,-135,86]) cylinder(r=15.5/2, h=48, center=true);
}

mirror([0,1,0]) translate([0,270,0]) arreggicuscinettidoppio();
translate([67,-124.2,237]) cube([45,5,33]);
translate([63,-124.2,237]) cube([14,15,14]);
translate([101,-124.2,256]) cube([14,15,14]);

translate([-15,-102,-8]) rotate([0,0,0]) vitozzo5();