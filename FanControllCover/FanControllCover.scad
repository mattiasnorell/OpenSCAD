include <../modules/roundedRect.scad>;

$wallThickness = 4;
$padding = 2;
$width = 80;
$height = 50;
$innerWidth = $width + $padding;
$outerWidth = $innerWidth + $wallThickness;

union(){
    difference(){
        union(){
            difference(){
                roundedRect([$outerWidth,$outerWidth,$height],10);
                translate([0,0,$wallThickness]){
                    roundedRect([$innerWidth,$innerWidth,$height],10);
                }
            }
        }

        rotate([0,90,0]){
            translate([-$height,0,-($outerWidth/2) - $wallThickness]){
                cylinder($fn = 30, h=$outerWidth+ ($wallThickness * 2), r=19);
            }
        }
    }
}