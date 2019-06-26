$height = 35;
$width = 25;
$thickness = 2;
$tubeWidth = 10;
$screwHoleWidth = 10;
$rodHoleWidth = 6;
$rodHoleOffset = 9;
$rodHolePosition = ($height / 2) - $rodHoleOffset;

module rounded_cylinder(r,h,n) {
  rotate_extrude(convexity=1) {
    offset(r=n) offset(delta=-n) square([r,h]);
    square([n,h]);
  }
}

union(){
    difference(){
        union(){
            difference(){
                translate([0,0,-$height/2]){
                    rounded_cylinder(r=$width/2,h=$height,n=1,$fn=120);
                }
                
                difference(){ 
                    union(){
                        translate([0,0,$height/2+1]){
                            rotate([180,0,0]){
                                cylinder($fn = 120, h=$screwHoleWidth, r1=$screwHoleWidth/2, r2=0);
                            }
                        }
                        
                        translate([0,0,-$thickness]){
                            cylinder($fn = 120, h=$height - $thickness, r=($width/2)-$thickness, center=true);
                        }
                    }
                }
            }
            
            
            difference(){
                cylinder($fn = 120, h=$height - ($thickness * 2), r=$tubeWidth/2, center=true);
                cylinder($fn = 120, h=$height + 10, r=($tubeWidth - $thickness)/2, center=true);
            }
        }

        translate([0,$width / 2, $rodHolePosition]){
            rotate([90,0,0]){
                cylinder($fn = 120, h=$thickness * 2, r=$rodHoleWidth / 2);
            }
        }
    }
}