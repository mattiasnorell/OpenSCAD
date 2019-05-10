// Board settings
$holeDistance = 14; // Distance between holes (C/C)
$holeRadius = 2.5;
$holesBetweenAttachmentPins = 4; // 
$boardThickness = 2;

// Hook settings
$width = 3;
$height = 30;
$thickness = 2;
$hookDepth = 15;
$hookHeight = 15;
$lockPinHeight = 4;
$lockPinWidth = $boardThickness;
$lockPinOffset = 2;

$lockPinTop = $height - ($holeRadius + $lockPinOffset);

triangle($holeRadius, $holeRadius, $holeRadius);

createHook();

module createHook() {
    union(){
        cube([$thickness,$width,$height]);
       
        toolHook();
        
        $pinCount = ceil($width / ($holesBetweenAttachmentPins * $holeDistance));
        $pinWidth = $holesBetweenAttachmentPins * $holeDistance * ($pinCount-1);
        $translateY = $width - $pinWidth;
        
        translate([0,$translateY/2 - ($holeRadius/2),0])
        union(){
            for (i = [0 : $pinCount - 1] ){
                translate([0, i * ($holesBetweenAttachmentPins * $holeDistance), 0])
                attachementPins();
            }
        }
    }
}

module toolHook(){
    translate([$thickness,0,0]){
        cube([$hookDepth,$width,$thickness]);
    }
    
    translate([$hookDepth,0,0]){
        cube([$thickness,$width,$hookHeight]);
    }
}

module lockPin(){
   translate([-$lockPinWidth, 0, $lockPinTop]){
        cube([$lockPinWidth, $holeRadius, $holeRadius]);
    }
    
    translate([-$lockPinWidth - ($holeRadius), 0, $lockPinTop ]){
        translate([0,0,$holeRadius])
        cube([$holeRadius, $holeRadius, $lockPinHeight]);
        
        translate([$holeRadius,$holeRadius,$holeRadius])
        rotate([0,180,90])
        triangle($holeRadius,$holeRadius,$holeRadius);
    } 
}

module supportPin(){
    translate([-$boardThickness, $holeRadius, $lockPinTop - $holeDistance + ($holeRadius / 2)]){
        translate([0,-($holeRadius / 2),0])
        rotate([0,90,0])
        cylinder(h = $boardThickness, r = $holeRadius / 2, $fn = 18);  
    }
}

module attachementPins(){ 
   lockPin();
   supportPin();
}

module triangle(height, width,depth ){
    rotate([0,0,0])
    
    union(){
        difference(){
            cube([height, width, depth]);
            
            translate([-(height/2),width,0])
            rotate([45,0,0])
                cube([height*2, width, depth*2]);
        }
    }
}