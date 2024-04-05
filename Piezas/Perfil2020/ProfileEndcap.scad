//Specify the height
$fn=32;
Height = 0 ; // [1:0.25:5]
InnerDiameter = 5;

2020_ProfileEndcap ();

module 2020_ProfileEndcap() {
    difference () {
        union () {
            //translate ([10,10,0]) cylinder (r=20, h = Height, $fn=6);

            translate ([0,6.75,Height]) cube ([4,6.5,5]);
            translate ([16,6.75,Height]) cube ([4,6.5,5]);

            translate ([6.75,0,Height]) cube ([6.5,4,5]);
            translate ([6.75,16,Height]) cube ([6.5,4,5]);

        }
    }
        translate ([10,10,Height]) rotate ([0,0,0]) cylinder (d=InnerDiameter,h=4);
}
