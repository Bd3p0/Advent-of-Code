$data = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 3/Day-3-input.txt'
$sampledata = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 3/Day-3-Sample.txt'
$rowcount = 0
$NumberCoords = @()
# x = column/position $y = row
$x =0 ; $y = 0 


foreach ($line in $sampleData){
    $position = 0 
    $y = 0
    
    #lists numbers on the line ( in order?)
    $numbers += $Line.split('.') | where {$_ -ne ''}
    
    $charList = $line.ToCharArray()
    foreach ($c in $charList){
        
        #special Character detection
        if ($c -notmatch "^\d+$" -and $c -notlike '.'){
           write-output "Special Character: `n rowcount: $rowcount"
           write-output "Position: $position `n"
        }
        $position++
        
        #Number Plotting
        #thought - Numbers as 3D array of Number and plot points of each digit 
        #thought  - instead of foreach, do until you hit a '.'?
        if ($c -match "^\d+$"){
            $x = $position ; $y = $rowcount
            $NumberCoords += ("$x,$y")
            write-output "Number: `n Rowcount: $rowcount `n position: $position"
        }
        if ($c -match "^\d+$" -and $charlist[$position] -notmatch "^\d+$"){
            write-output " Numbe Ends: `n rowcount: $rowcount"
            write-output " Position: $position `n"
        }
       
    }
    $rowcount ++


}
foreach ($coord in $NumberCoords){


}