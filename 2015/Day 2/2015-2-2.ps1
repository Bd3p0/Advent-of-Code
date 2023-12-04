$data = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2015/Day 2/day-2-input.txt'
$totalPaper = 0; $totalRibbon = 0
foreach ($line in $data){
    $dimentions =@()
    $a = $line.split('x') 
    $a |% {$dimentions += [int]$_}
    
    $l,$w,$h = $dimentions | sort-object -Descending
    #2*l*w + 2*w*h + 2*h*l
   $area = (2*$l*$w) + (2*$w*$h) + (2*$h*$l) + ($w * $h)
    $ribbon = ($w * 2) + ($h * 2) + ($l *$W * $h)

   $totalPaper += $area
   $totalribbon += $ribbon
}
$totalPaper
$totalribbon