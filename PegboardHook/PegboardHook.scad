// Board settings
$holeDistance = 14; // Distance between holes (C/C)
$holeRadius = 3;
$holesBetweenAttachmentPins = 4; // 
$boardThickness = 2;

// Hook settings
$width = 100;
$height = 30;
$thickness = 2;
$hookDepth = 15;
$hookHeight = 15;
$lockPinHeight = 4;
$lockPinWidth = $boardThickness;
$lockPinOffset = 4;

$lockPinTop = $height - ($holeRadius + $lockPinOffset);

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
    
    translate([-$lockPinWidth - ($holeRadius), 0, $lockPinTop]){
        cube([$holeRadius, $holeRadius, $lockPinHeight + $holeRadius]);
    } 
}

module supportPin(){
    translate([-$boardThickness, $holeRadius, $lockPinTop - $holeDistance + ($holeRadius / 2)]){
        translate([0,-($holeRadius / 2),0])
        rotate([0,90,0])
        cylinder(h = $boardThickness, r = $holeRadius / 2, $fn = 50);  
    }
}

module attachementPins(){ 
   lockPin();
   supportPin();
}