handle_height = 150;
handle_diameter = 25;
inner_od = 20;
bottom_pillar_height = 30;
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

module main()
{
	difference()
	{
        beer_tap_handle();
        translate([2.,-3,-2])
          import ("BeerTapHandle-Thread.stl", convexity = 4);
	}
}

main();
