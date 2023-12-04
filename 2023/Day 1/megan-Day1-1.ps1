$data = Get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 1/1-input.txt'
$value = ''; $total = 0

foreach ($line in $data){
    $charList = $line.ToCharArray()
    $revCharList = $charlist[-1..-$charlist.length]
    
    foreach ($char in $charlist){
        if ($char -match "^\d+$"){
        $value += [string]$char 
        Break
        }
    }
    foreach ($char in $revcharlist){
        if ($char -match "^\d+$"){
        $value += [string]$char 
         Break
        }
    }
    $total += [int]$value
    $value = ''
 
}
$total