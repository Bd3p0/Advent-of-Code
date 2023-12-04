$data = Get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 1/1-input.txt'
$calibrationData =@() 




foreach ($value in $Data){
    $intergers = @()
    $characters = $value.ToCharArray()
    foreach ($c in $characters){
        if ($c -match "^\d+$"){
            $intergers += $c
        }
    }
    $firstLast = $intergers[0] + $intergers[-1]
    $calibrationData += [int]$firstLast
}
$total = 0
foreach ($cData in $calibrationdata){
    $total = $total + $cData
}
$total