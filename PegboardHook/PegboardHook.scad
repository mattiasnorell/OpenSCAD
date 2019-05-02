$holeDistance = 23;
$attachmentHookSafeDistance = 50;

$holeRadius = 3;
$width = 10;
$boardThickness = 2;
$thickness = 2;
$totalHeight = 30;
$hookDepth = 15;
$hookHeight = 15;
$lockPinHeight = 4;
$lockPinWidth = $boardThickness;
$lockPinOffset = 2;

$lockPinTop = $totalHeight - ($holeRadius + $lockPinOffset);

createHook();

module createHook() {
    union(){
        cube([$thickness,$width,$totalHeight]);
       
        toolHook();
        
        if($width < $attachmentHookSafeDistance){
            attachementPins();
        }else{
            for (i = [0 : $width / $attachmentHookSafeDistance - 1] ){
                translate([0, i * ($width / $attachmentHookSafeDistance), 0])
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
   translate([-$lockPinWidth, ($width - $holeRadius) / 2, $lockPinTop]){
        cube([$lockPinWidth, $holeRadius,$holeRadius]);
    }
    
    // Lock pin vertical
    translate([-$lockPinWidth - ($holeRadius), ($width - $holeRadius) / 2, $lockPinTop]){
        cube([$holeRadius, $holeRadius, $lockPinHeight + $holeRadius]);
    } 
}

module supportPin(){
    translate([-$boardThickness, ($width + $holeRadius) / 2, $lockPinTop - $holeDistance + ($holeRadius / 2)]){
        translate([0,-($holeRadius / 2),0])
        rotate([0,90,0])
        cylinder(h = $boardThickness, r = $holeRadius / 2, $fn = 50);  
    }
}

module attachementPins(){ 
   lockPin();
   supportPin();
}