//-----------------------------//
// Atari SIO2SD Mini Enclosure //
//        Richi 10.2024        //
//-----------------------------//

include <BOSL2/std.scad>
use <SF Atarian System.ttf>

$fn = 256;
DPSx = 58.50;
DPSy = 39;
spodni = 0;

if (spodni == 1){
    diff(){
        // dno krabičky
        move([1.75, 0, 0]) cuboid([DPSx + 2 + 3.5 + 4, DPSy + 2 + 4, 2], chamfer = 1.5, edges = [BACK+LEFT, LEFT+FRONT, FRONT+    RIGHT, RIGHT+BACK, BOT], anchor = BOTTOM){

            // podpěry na DPS, spodní strana krabičky
            move([-26.5, -15, 0]) attach (TOP, BOT) cyl(d = 8, l = 5.6, rounding1 = -2){
                tag("remove") cyl(d = 3.5, l = 9.6, rounding = 0);
                tag("remove") move([0, 0, -1.8]) cyl(d = 5.7, l = 6, rounding1 = -1, rounding2 = 1);
        
            move([49.5, 30, 0]) cyl(d = 8, l = 5.6, rounding1 = -2){
                tag("remove") cyl(d = 3.5, l = 9.6, rounding = 0);
                tag("remove") move([0, 0, -1.8]) cyl(d = 5.7, l = 6, rounding1 = -1, rounding2 = 1);
            }        
            }
        } 

    // stěny krabičky
    move([0, 0, 2]) rect_tube(isize = [DPSx + 2, DPSy + 2], wall = 2, h = 7.15 + 0.85, chamfer = ([0, 1.5, 1.5, 0]), irounding = ([2, 2, 2, 2])) 

    // rozšíření stěny na konektor
    move([34, 0, 0]) cuboid([3.5, 30.7 + 14.3, 7.15 + 0.85], chamfer = 1.5, edges = [FRONT+RIGHT, RIGHT+BACK]);

    // drážka na konektor
    tag("remove") move([33, 0, 2 + 0.85]) cuboid([2.2, 30.7 + 1, 10], anchor = BOTTOM); 

    // otvor na konektor
    tag("remove") move([33, 0,3.50 + 0.85]) cuboid([6.5, 30.7 + 1 - 3, 10], anchor = BOTTOM); 

    // podélná drážka okolo krabičky, spodní
    tag("remove") move([-1.5, 0, 9]) rect_tube(isize = [DPSx - 3, DPSy], wall = 2, h = 2, rounding = ([0, 2, 2, 0]));
   
    // výřez pro MicroSD kartu
    tag("remove") move([-31.25, 0, 2 + 2 + 6]) cuboid([4, 16, 4]);     
    
    }

    // drážky po stranách
    ycopies(45.5) move([1.75, 0, 6]) cuboid([3, 0.5, 8]);
    xcopies(12) ycopies(45.5) move([1.75, 0, 6]) cuboid([3, 0.5, 8]);
    xcopies(24) ycopies(45.5) move([1.75, 0, 6]) cuboid([3, 0.5, 8]);
    xcopies(36) ycopies(45.5) move([1.75, 0, 6]) cuboid([3, 0.5, 8]);
    xcopies(48) ycopies(45.5) move([1.75, 0, 6]) cuboid([3, 0.5, 8]);
}

else {
    diff(){
        // dno krabičky
        move([1.75, 0, 0]) cuboid([DPSx + 2 + 3.5 + 4, DPSy + 2 + 4, 2], chamfer = 1.5, edges = [BACK+LEFT, LEFT+FRONT, FRONT+RIGHT, RIGHT+BACK, BOT], anchor = BOTTOM){
    
            // podpěry na DPS, vrchní strana krabičky
            move([-26.5, 15, 0]) attach (TOP, BOT) cyl(d = 6, l = 8.6, rounding1 = -2){
                move([0, 0, 0.5]) tag("remove") cyl(d = 2.6, l = 9.6);  // otvor na samořezku 3mm/9.5mm
        
            move([49.5, -30, 0]) cyl(d = 6, l = 8.6, rounding1 = -2){
                move([0, 0, 0.5]) tag("remove") cyl(d = 2.6, l = 9.6);  // otvor na samořezku 3mm/9.5mm
            }       
            }
            
            // otvory pro 3mm LEDky
            tag("remove") move([-14.6, 15, 0]) cyl(d = 3.3, 4);
            tag("remove") move([-14.6 + 6, 15, 0]) cyl(d = 3.3, 4);
            tag("remove") move([-14.6 + 6 + 6, 15, 0]) cyl(d = 3.3, 4);
    
            // otvory pro tlačítka
            tag("remove") move([-31 + 39, 19.5 - 6.75, 0]) cyl(d = 4, 4);
            tag("remove") move([-31 + 39, -19.5 + 6.75, 0]) cyl(d = 4, 4);
    
            // texty
            move([-27.2, 0, -0.55]) rot([180, 0, -90]) color ("red") linear_extrude(height = 0.5) text("ATARI SIO2SD", size = 6, font ="SF Atarian System", anchor=CENTER);
            move([-21, -11, -0.55]) rot([180, 0, -90]) color ("red") linear_extrude(height = 0.5) text("MINI", size = 6, font ="SF Atarian System", anchor=CENTER);
    
            move([-14.6, 10, -0.55]) rot([180, 0, -90]) color ("red") linear_extrude(height = 0.5) text("SD ACT.", size = 3.4, font ="Arial:style=Bold", anchor=LEFT);
            move([-8.6, 10, -0.55]) rot([180, 0, -90]) color ("red") linear_extrude(height = 0.5) text("SIO ACT.", size = 3.4, font ="Arial:style=Bold", anchor=LEFT);
            move([-2.6, 10, -0.55]) rot([180, 0, -90]) color ("red") linear_extrude(height = 0.5) text("ERROR", size = 3.4, font ="Arial:style=Bold", anchor=LEFT);
            move([14.8, 12.75, -0.55]) rot([180, 0, -90]) color ("red") linear_extrude(height = 0.5) text("SHIFT", size = 3.4, font ="Arial:style=Bold", anchor=CENTER);
            move([14.8, -12.75, -0.55]) rot([180, 0, -90]) color ("red") linear_extrude(height = 0.5) text("DRIVE", size = 3.4, font ="Arial:style=Bold", anchor=CENTER);
        }        
    }

    diff(){   
        // stěny krabičky
        move([0, 0, 2]) rect_tube(isize = [DPSx + 2, DPSy + 2], wall = 2, h = 7.15 + 0.85 + 1, chamfer = ([0, 1.5, 1.5, 0]), irounding = ([2, 2, 2, 2])) 

        // rozšíření stěny na konektor
        move([34, 0, 0]) cuboid([3.5, 30.7 + 14.3, 7.15 + 0.85 + 1], chamfer = 1.5, edges = [FRONT+RIGHT, RIGHT+BACK]);

        // drážka na konektor
        tag("remove") move([33, 0, 2 + 0.85]) cuboid([2.2, 30.7 + 1, 10], anchor = BOTTOM); 

        // otvor na konektor
        tag("remove") move([33, 0, 3.50 + 0.85]) cuboid([6.5, 30.7 + 1 - 3, 10], anchor = BOTTOM); 

        // podélná drážka okolo krabičky, vrchní
        tag("remove") move([-2.5, 0, 10]) rect_tube(isize = [DPSx - 1, DPSy + 4], wall = 2, h = 2, rounding = ([0, 2, 2, 0]), irounding = ([0, 2, 2, 0]));
        tag("remove") move([32, 0, 10]) cuboid([9, 46, 2], anchor = BOTTOM);
    
       // výřez pro MicroSD kartu
       tag("remove") move([-31.25, 0, 2 + 2 + 6]) cuboid([4, 16, 4]);     
    }
    
    // drážky po stranách
    ycopies(45.5) move([1.75, 0, 6]) cuboid([3, 0.5, 8]);
    xcopies(12) ycopies(45.5) move([1.75, 0, 6]) cuboid([3, 0.5, 8]);
    xcopies(24) ycopies(45.5) move([1.75, 0, 6]) cuboid([3, 0.5, 8]);
    xcopies(36) ycopies(45.5) move([1.75, 0, 6]) cuboid([3, 0.5, 8]);
    xcopies(48) ycopies(45.5) move([1.75, 0, 6]) cuboid([3, 0.5, 8]);
}