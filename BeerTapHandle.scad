handle_height = 50;
handle_diameter = 12;
inner_od = 12;
bottom_pillar_height = 10;
shieldSize = 50;
fn = 100;


module beer_tap_handle()
{
	union()
	{
        hull()
        {
            translate([0,0,handle_height + bottom_pillar_height])
            sphere(r=20, $fn=fn);

            translate([0,0,bottom_pillar_height])
            linear_extrude(height=20)
            {
                circle(handle_diameter, $fn=fn);
            }
        }
	
        hull()
        {
            translate([0,0,bottom_pillar_height])
                linear_extrude(height=0.1)
                {
                    circle(handle_diameter, $fn=fn);
                }
            translate([0,0,bottom_pillar_height/2])
                linear_extrude(height=0.1)
                {
                    circle(inner_od, $fn=fn);
                }
        }

        linear_extrude(height=bottom_pillar_height)
        {
            circle(inner_od, $fn=fn);
        }
	}
}

module fillet(r, h) {
    translate([r / 2, r / 2, 0])

        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);

            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true);

        }
}

module shield(h,b,t) 
{
    difference() {
        cube([h, b, t], center = true);
        translate([-h/2, -b/2, 0])
            fillet(h/4,t+1);
        translate([-h/2, b/2, 0])
            rotate([0,0,-90])
                fillet(h/4,t+1);
        translate([h/2, -b/2, 0])
            rotate([0,0,90])
                fillet(h/4,t+1);
        translate([h/2, b/2, 0])
            rotate([0,0,180])
                fillet(h/4,t+1);
    }
    translate([0,b/2-2, 0])
        rotate([0,0,0])
            fillet(h/3,t+1);
    translate([0,b/2-2, 0])
        mirror([1,0,0]) 
            fillet(h/3,t+1);

}

module main()
{
    rotate([-90,0,0])
        translate([0,-handle_height-shieldSize-bottom_pillar_height+shieldSize/5,0])
            shield(shieldSize,shieldSize,10);
    
	difference()
	{
        beer_tap_handle();
        translate([2.,-3,-2])
          import ("BeerTapHandle-Thread.stl", convexity = 4);
    }
}

main();
