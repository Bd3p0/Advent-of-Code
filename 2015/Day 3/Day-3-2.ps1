$data = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2015/Day 3/day-3-input.txt'

$directions = $data.tochararray()
$x = 0 ; $y = 0
$x1 =0 ; $y1 =0
$coords = @()
$count = 0


foreach ($d in $directions){
    
    

    if( $count %2 -eq 1 ){
        
        switch ($d) {
            '^' {  $y++}
            'v' {  $y--}
            '>' {  $x++}
            '<' {  $x--}
        }
    }
    if ($count %2 -eq 0){
        
        switch ($d) {
            '^' {  $y1++}
            'v' {  $y1--}
            '>' {  $x1++}
            '<' {  $x1--}
        }

    }
    $count++

    $coords += "$x,$y"
    $coords += "$x1,$y1"

}
($coords | sort |uniq).count 