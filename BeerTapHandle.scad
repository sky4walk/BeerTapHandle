// How tall the grip should be where the words are placed
handle_height = 150;
// How wide the grip should be.
handle_diameter = 25;
// The diameter of the tap part you're attaching to.
handle_id = 10;
// How tall do you want the attachment to be.
bottom_pillar_height = 30;


//////////////////////////
//Variables
//////////////////////////

// How fine do you want the circles/smoothing to be. (larger takes longer to render.
fn = 100;
inner_od = handle_id + 10;


main();
////////////////////////////////////////////////////////


module main()
{
	difference()
	{
        beer_tap_handle();
	}
}

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
            difference()
            {
                circle(inner_od, $fn=fn);
                circle(handle_id, $fn=fn);
            }
        }
	}
}
