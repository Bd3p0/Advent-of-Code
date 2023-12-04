$data = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2015/Day 1/Day-1-Input.txt'
$floors = 0
$directions = $data.tochararray()

switch ($directions){
    '(' {$floors++} 
    ')' {$floors--}
}
$floors
