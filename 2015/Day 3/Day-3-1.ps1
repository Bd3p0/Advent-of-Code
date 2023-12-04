$data = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2015/Day 3/day-3-input.txt'

$directions = $data.tochararray()
$x = 0 ; $y = 0
$coords = @()

foreach ($d in $directions){
    switch ($d) {
        '^' {  $y++}
        'v' {  $y--}
        '>' {  $x++}
        '<' {  $x--}
    }

    $coords += "$x,$y"

}
($coords | sort |uniq).count 