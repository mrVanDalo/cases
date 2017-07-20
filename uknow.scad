
// draw a hole
// size = [ x, y, z ] the size of the cube
module hole( size, pos=[0, 0, 0] ){
  translate( pos ) {
    cube( size , true);
  }
}







//  create a board with holes
//  -------------------------
//
//    +--------------------------------------------------+
//    |   ---       ---       ---       ---        ---   |
//    |                                                  |
//    |                                                  |
//    |   ---       ---       ---       ---        ---   |
//    |                                                  |
//    |                                                  |
//    |   ---       ---       ---       ---        ---   |
//    |                                                  |
//    |                                                  |
//    |   ---       ---       ---       ---        ---   |
//    |                                                  |
//    +--------------------------------------------------+
//
// holes  = [ x , y ]  number of holes
// size   = [ x, y, z] the size of the board
// hole   = [ x, y ]   the size of a hole in the board
// offset = [ x, y ]   space to save at the borders
//
module board( holes, size, holesize , offset = [ 0, 0 ]){

    full_xsize = size[0];
    full_ysize = size[1];

    xsize = full_xsize - offset[0];
    ysize = full_ysize - offset[1];
    depth = size[2];

    xholes = holes[0];
    yholes = holes[1];

    xhole_size = holesize[0] ;
    yhole_size = holesize[1] ;

    xoffset = xhole_size / 2;
    yoffset = yhole_size / 2;

    full_xhole_size = xholes * xhole_size;
    full_yhole_size = yholes * yhole_size;

    full_xhole_space = xsize - full_xhole_size - xhole_size;
    full_yhole_space = ysize - full_yhole_size - yhole_size;

    xhole_space = full_xhole_space / xholes ;
    yhole_space = full_yhole_space / yholes ;

    difference(){
        color("yellow")cube(size, true);
        translate( [ - xsize / 2
                   , - ysize /2
                   , 0
                   ] ){
            for (x = [0 : xholes]){
                for (y = [0 : yholes]){
                    color("LightBlue"){
                        hole( [ xhole_size
                              , yhole_size
                              , depth + 10
                              ]
                            , [ xoffset + x * xhole_size + x * xhole_space
                              , yoffset + y * yhole_size + y * yhole_space
                              , 0
                              ]
                        );
                    }
                }
            }
       }
  }
}


// example board
board( [5, 4]        // holes todo : not correct [+1, +1] has to be calculated always
     , [480, 350, 3] // board size
     , [20, 5]       // holesize
     , [15,15]       // offset
);