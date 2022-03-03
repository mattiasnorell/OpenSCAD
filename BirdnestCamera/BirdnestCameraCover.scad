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

$bottomThickness = 2;
$outerWidth = 160;
$outerHeight = 120;
$rimHeight = 30;

union(){
    translate([0,0,20]){
        rotate([10,0,0]){
            roundedRect([$outerWidth,$outerHeight+1,$bottomThickness],5);
        }
    }
    
    difference(){
        translate([0,0,$bottomThickness]){
            difference(){
                roundedRect([$outerWidth,$outerHeight,$rimHeight],5);
                translate([0,0,-2]){
                    roundedRect([$outerWidth - $bottomThickness * 2,$outerHeight - $bottomThickness * 2,$rimHeight*2],3);
                }
            }
        }
        
        translate([0,0,22]){
            rotate([10,0,0]){
                roundedRect([$outerWidth + 10,$outerHeight + 10,30],5);
            }
        }
    }
}