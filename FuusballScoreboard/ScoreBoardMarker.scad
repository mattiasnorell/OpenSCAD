union() {
    difference() { 
        rotate([0,90,0]){
            cylinder($fn = 120, h=7, r=20/2, center=false);
        }

        rotate([0,90,0]){
            cylinder($fn = 120, h=20, r=6/2, center=true);
        }
    }
    
    difference() { 
        union(){
            translate([0,0,0]){
                rotate([0,90,0]){
                    cylinder($fn = 120, h=24/2, r1=32/2, r2=0);
                }
                
              /*  rotate([0,-90,0]){
                    cylinder($fn = 120, h=10/2, r1=30/2, r2=0);
                }*/
            }
            
        }
        
        rotate([0,90,0]){
            cylinder($fn = 120, h=45, r=20/2, center=true);
        }
    }
}

