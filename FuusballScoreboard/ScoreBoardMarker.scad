union() {
    difference() { 
        rotate([0,90,0]){
            cylinder($fn = 120, h=15/2, r=20/2, center=true);
        }

        rotate([0,90,0]){
            cylinder($fn = 120, h=20/2, r=6/2, center=true);
        }
    }
    
    difference() { 
        union(){
            translate([0,0,0]){
                rotate([0,90,0]){
                    cylinder($fn = 120, h=10/2, r1=30/2, r2=0);
                }
                
                rotate([0,-90,0]){
                    cylinder($fn = 120, h=10/2, r1=30/2, r2=0);
                }
            }
            
        }
        
        rotate([0,90,0]){
            cylinder($fn = 120, h=45/2, r=20/2, center=true);
        }
    }
}

