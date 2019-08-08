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