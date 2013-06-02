// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <x-end.scad>

module x_end_motor_base(){
 x_end_base();
 translate(v=[-15,33,26.5]) cube(size = [17,48,53], center = true);
}

module x_end_motor_holes(){
 x_end_holes();
 // Position to place
 translate(v=[-1,34,30.25]){
  // Belt hole
  translate(v=[-14,1,0]) cube(size = [10,46,22], center = true);
  // Motor mounting holes
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

  translate(v=[20,15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);



  translate(v=[20,17.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);  //add 3dita.falaschi.com
  translate(v=[1,17.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);   //add 3dita.falaschi.com

  translate(v=[-10,16.5,-15.5]) rotate(a=[0,0,0])  cube(size = [30,2,3.58], center = true);                //add 3dita.falaschi.com
  translate(v=[-4,16.5,-15.5]) rotate(a=[0,0,0])  cube(size = [10,2,6.17], center = true);  			//add 3dita.falaschi.com




  translate(v=[20,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);

  // Material saving cutout 
  translate(v=[-10,12,10]) cube(size = [60,42,42], center = true);

  // Material saving cutout
  translate(v=[-10,42,-30]) rotate(a=[45,0,0])  cube(size = [60,42,42], center = true);
  // Motor shaft cutout
  translate(v=[0,1,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=17, $fn=6);
  // Motor shaft cutout
  translate(v=[0,2,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=17, $fn=6);
 }
}

// Final part
module x_end_motor(){
 difference(){
  x_end_motor_base();
  x_end_motor_holes();
 }
}

x_end_motor();