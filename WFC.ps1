# creates 3-d array of 1s
function generate-superpositions{
    $eigenvals = @(((1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1)),((1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1)),((1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1)),((1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1)),((1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1)),((1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1)),((1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1)),((1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1)),((1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1)))
    return $eigenvals
}

# draws the sudoku puzzle in a 2d form, as opposed to a huge list 1 at a time
function display-puzzle{
    param(
        $draw
    )
    for ($x = 0; $x -le 8; $x++){
        $pln = ""
        for ($y = 0; $y -le 8; $y++){
            switch ($draw[$x][$y]){  ## not sure if you can append ints to strings in any way, but this works
                0 {$pln += "0 "}
                1 {$pln += "1 "}
                2 {$pln += "2 "}
                3 {$pln += "3 "}
                4 {$pln += "4 "}
                5 {$pln += "5 "}
                6 {$pln += "6 "}
                7 {$pln += "7 "}
                8 {$pln += "8 "}
                9 {$pln += "9 "}
            }
        }
        $pln
    }
    $pln = ""
    $pln
}

# convers 2-d [0-9] form into a 3-d [0-1] form
function one-hot-encode{
    param(
        $two
    )
    $three = @(((0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0)),((0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0)),((0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0)),((0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0)),((0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0)),((0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0)),((0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0)),((0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0)),((0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0,0)))
    for ($x = 0; $x -le 8; $x++){
        for ($y = 0; $y -le 8; $y++){
            if ($two[$x][$y] -ne 0){
                $tmp = $two[$x][$y]
                $tmp = $tmp - 1
                $three[$x][$y][$tmp] = 1
            }
        }
    }
    return $three
}

# output contraint violations based on a given confirmed value
# we only propagate with a single constraint because speed, making it less accurate
# can sovle all easy and most medium puzzles
# haven't tried on "hard" ones
function propogate-wave{
    param(
        $eigenvals,
        $propx,
        $propy,
        $propz
    )

    # whole propagation happens from a single loop
    for ($i = 0; $i -le 8; $i++){
        $eigenvals[$i][$propy][$propz] = 0
        $eigenvals[$propx][$i][$propz] = 0
        $eigenvals[$propx][$propy][$i] = 0
    }    
    return $eigenvals
}

# slower way of doing it, but powershell has restrictions on the amount of values which can be returned at once
function initialise-eigenvals{
    param(
        $threedeepuzzle
    )
    $evals = generate-superpositions
    for ($x = 0; $x -le 8; $x++){
        for ($y = 0; $y -le 8; $y++){
            for ($z = 0; $z -le 8; $z++){
                if ($threedeepuzzle[$x][$y][$z] -eq 1){
                    # re-generates and re-propagates for every tile on the board that has been filled already
                    $evals = propogate-wave $evals $x $y $z
                }
            }    
        }
    }
    return $evals
}

function step{
    param(
        $eigens,
        $problem
    )
    $bv = 9   # best value
    $bx = 0   # best x
    $by = 0   # best y
    $bz = 0   # best z
    $lz = 0   # last z checked
    for ($x = 0; $x -le 8; $x++){
        for ($y = 0; $y -le 8; $y++){
            $sum = 0
            for ($z = 0; $z -le 8; $z++){
                if ($eigens[$x][$y][$z] -eq 1){
                    $sum++
                    $lz = $z
                }
            }
            # assuming sum isn't 0
            if ($sum -ne 0){
                # the one with the lowest v is the best one to place
                if ($sum -le $bv){
                    $bv = $sum
                    $bx = $x
                    $by = $y
                    $bz = $lz
                }
            }    
        }
    }
    # places onto grid and returns new board state
    $problem[$bx][$by] = $bz + 1
    return $problem
}

function solve{
    param(
        $twodeepuzzle,
        $v
    )
    # need to place 1 item per blank tile and the puzzle will be finished
    $numblank = 0
    for ($x = 0; $x -le 8; $x++){
        for ($y = 0; $y -le 8; $y++){
            if ($twodeepuzzle[$x][$y] -eq 0){
                $numblank++
            }
        }
    }
    # for each blank tile
    for ($itt = 1; $itt -le $numblank; $itt++){
        # generate 3-d state
        $ready = one-hot-encode $twodeepuzzle
        # propagate all constraints
        $eig = initialise-eigenvals $ready
        # find the most likely tile and fill it
        $twodeepuzzle = step $eig $twodeepuzzle

        if ($v -eq 1){   # verbose output
            display-puzzle $twodeepuzzle
        }
    }
    return $twodeepuzzle
}


## Your puzzle goes here
$puzzReadable = @((9,3,0,6,5,0,0,2,7),
                  (0,0,8,0,0,2,9,0,5),
                  (2,0,0,0,1,0,0,0,0),
                  (3,5,0,0,9,0,0,7,0),
                  (7,0,0,5,8,0,3,4,0),
                  (0,1,0,7,0,3,2,0,0),
                  (1,2,6,3,0,4,0,0,0),
                  (0,9,0,8,0,5,0,0,0),
                  (5,0,0,1,2,9,7,6,0))

## set to 1 if you want to see each step
$verbose = 0
      
display-puzzle $puzzReadable
$p = solve $puzzReadable $verbose
display-puzzle $p
