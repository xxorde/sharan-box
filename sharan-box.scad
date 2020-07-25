/*
    Alexander Sosna <alexander@sosna.de>

    Frame to convert a VW Sharan II / Seat Alhambra II to a camper.
    
    What you need:
    - 2 x this frame
    - 5 x container (Euronorm/Eurobehälter/Kleinladungsträger) 600 mm × 400 mm x 320 mm
    - 2 x container 600 mm × 400 mm x 120 mm
    - mattress 200 cm x 140 cm
    - 1 x VW Sharan II
*/


// Dimensions of the frame
length=660;
width=610;
hight=194;

// Material
// https://www.hornbach.de/shop/Furnierschichtholz-24x40x2400-mm-WoodPro/5506215/artikel.html
b_width=40;
b_hight=24;
// https://www.hornbach.de/shop/Latte-24x48x3000-mm-Fichte-Tanne/1000686/artikel.html
l_num=4;
l_width=48;
l_hight=24;

// Stützen
module sturdy() {
    translate([0,0,b_hight]){
        color( "GreenYellow", 1.0 ) {
            a_sturdy=[b_width,b_hight,hight-b_hight-b_width];
            echo("Stütze A",a_sturdy);
            cube(a_sturdy);
        }
        translate([0,b_hight,0]) {
            // Rechte Bodenlatte
            color( "Lime", 1.0 ) {
                b_sturdy=[b_hight,b_width,hight-b_hight-b_width];
                echo("Stütze B",b_sturdy);
                cube(b_sturdy);
            }
        }
    }
}

// Linke Bodenlatte
color( "ForestGreen", 1.0 ) {
    l_bodenlatte=[length,b_width,b_hight];
    echo("Linke Bodenlatte",l_bodenlatte);
    cube(l_bodenlatte);
}

translate([0,b_width,0]) {
    // Vordere Bodenlatte
    v_bodenlatte=[b_width,width-b_width,b_hight];
    echo("Vordere Bodenlatte",v_bodenlatte);
    cube(v_bodenlatte);
}

translate([length-b_width,b_width,0]) {
    // Hintere Bodenlatte
    h_bodenlatte=[b_width,width-b_width,b_hight];
    echo("Hintere Bodenlatte",h_bodenlatte);
    cube(h_bodenlatte);
}

 translate([0,width-b_width,0]) {
    // Rechte Bodenlatte
    //cube([length,b_width,b_hight]);
}

translate([0,b_hight,hight-b_width]) {
    // Vordere Deckenlatte
    v_deckenlatte=[b_hight,width-2*b_hight,b_width];
    echo("Vordere Deckenlatte",v_deckenlatte);
    cube(v_deckenlatte);
}

 translate([0,0,hight-b_width]) {
    // Linke Deckenlatte
    color( "ForestGreen", 1.0 ) {
        l_deckenlatte=[length,b_hight,b_width];
        echo("Linke Deckenlatte",l_deckenlatte);
        cube(l_deckenlatte);
    }
}
    
 translate([0,width-b_hight,hight-b_width]) {
    // Rechte Deckenlatte
    color( "ForestGreen", 1.0 ) {
        r_deckenlatte=[length,b_hight,b_width];
        echo("Rechte Deckenlatte",r_deckenlatte);
        cube(r_deckenlatte);
    }
}

translate([length-b_hight,b_hight,hight-b_width]) {
    // Hintere Deckenlatte
    h_deckenlatte=[b_hight,width-2*b_hight,b_width];
    echo("Hintere Deckenlatte",h_deckenlatte);
    cube(h_deckenlatte);
}

for (i = [1:l_num]) {
    translate([((length/(l_num+1))*i)-l_width/2,b_hight,hight-b_hight]) {
        // Lattenrost
        color( "Olive", 0.5 ) {
            v_deckenlatte=[b_width,width-2*b_hight,b_hight];
            echo("Lattenrost ",i,v_deckenlatte);
            cube(v_deckenlatte);
        }
    }
}

// Vorne links
sturdy();

// Vorne rechts
translate([0,width,0]) {
    mirror([0,1,0]){
        sturdy();
    }
}

// Hinten links
translate([length,0,0]) {
    mirror([1,0,0]){
        sturdy();
    }
}

// Hinten rechts
translate([length,width,0]) {
    mirror([1,0,0]){
        mirror([0,1,0]){
            sturdy();
        }
    }
}
