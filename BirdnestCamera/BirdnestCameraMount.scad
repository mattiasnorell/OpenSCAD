module roundedRect(size, radius, fn = 30)
{
    x = size[0] / 2;
    y = size[1] / 2;
    z = size[2];

    linear_extrude(height=z)
    hull()
    {
        translate([-x+radius, -y+radius, 0])
        circle(r=radius, $fn = fn);

        translate([x-radius, -y+radius, 0])
        circle(r=radius, $fn = fn);

        translate([-x+radius, y-radius, 0])
        circle(r=radius, $fn = fn);

        translate([x-radius, y-radius, 0])
        circle(r=radius, $fn = fn);
    }
}

module camera(length, radius) {
    hull(){
        translate([radius,0,0]){
            cylinder($fn = 60, h=10, r=radius);
        }
        
        translate([length - radius,0,0]){
            cylinder($fn = 60, h=10, r=radius);
        }
     }
     
     
}

module piMountPin() {
     difference(){
        cylinder($fn = 60, h=8, r=2);
        cylinder($fn = 60, h=10, r=1);
    }     
}

module piMount() {
    translate([0,0,0]){
        piMountPin();
    }
    
    translate([58,0,0]){
        piMountPin();
    }
    
    translate([0,49,0]){
        piMountPin();
    }
    
    translate([58,49,0]){
        piMountPin();
    }
}

module wallMount(thickness){
    $width = 10;
    $height = 15;
    $length = 20;
    
    cube([$width, $length, thickness]);
    
       difference(){
        cube([$width, thickness, $height]);
        translate([$width / 2,5, ($height/2) + (thickness / 2)]){
            rotate([90,0,0]){
                cylinder($fn = 60, h=6, r=2);
            }
        }
 }
}

$bottomThickness = 3;
$padding = 2;
$width = 80;
$height = 50;
$innerWidth = $width + $padding;
$outerWidth = 160;
$outerHeight = 120;

$cameraModuleLength = 70;
$cameraModuleWidth = 20;

$rimHeight = 5;



union(){
    difference(){
        union(){
            difference(){
                roundedRect([$outerWidth,$outerHeight,$bottomThickness],5);
                
                translate([0,-35,0]){
                    rotate([0,0,90]){
                        camera($cameraModuleLength, $cameraModuleWidth /2);
                    }
                }
                
            }
            
            translate([20,($cameraModuleWidth/2),0]){
                cube([3, $cameraModuleWidth, $bottomThickness]);
             }
             
             translate([50,($cameraModuleWidth/2),0]){
                cube([3, $cameraModuleWidth, $bottomThickness]);
             }
            
            translate([-18,-48,0]){
                rotate([0,0,90]){
                    piMount();
                }
            }
        }

    }

    translate([0,0,$bottomThickness]){
        difference(){
            roundedRect([$outerWidth - $bottomThickness,$outerHeight-$bottomThickness,$rimHeight],5);
            translate([0,0,-2]){
                roundedRect([$outerWidth - $bottomThickness * 2,$outerHeight - $bottomThickness * 2,$rimHeight*2],3);
            }
        }
    }
    
    translate([-85, 5,0]){
        rotate([0,0,-90]){
            wallMount($bottomThickness);
        }
    }
    
    translate([85, -5,0]){
        rotate([0,0,90]){
            wallMount($bottomThickness);
        }
    }
    
    translate([5, 65,0]){
        rotate([0,0,180]){
            wallMount($bottomThickness);
        }
    }
    
    translate([-5, -65,0]){
        rotate([0,0,0]){
            wallMount($bottomThickness);
        }
    }
}