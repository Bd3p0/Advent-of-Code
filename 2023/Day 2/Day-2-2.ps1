$Data = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 2/Day-2-Input.txt'
$sampleData = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 2/Day-2-Sample.txt'
$totalpower =0 



foreach ($games in $Data){
    $gameNumber = (($games -split(":"))[0] -split(' '))[1]
    $sets = ($games -split(':'))[1] -split(';')
    $setcount =0 
    
    $colortable =[Ordered]@{
        "GameNumber" = $gameNumber
        "Set" = $setcount
        "Red" = 0
        "Green" = 0
        "Blue" = 0
    }
    
    foreach ($set in $sets){
       
        
        $ColorNumberList = $set -split(',')
        $setcount ++
        $colortable["Set"] = $setCount
    
        

        foreach ($i in $ColorNumberList){
            $color,$number = $i.split(' ')[2..1]
            if ([int]$colorTable["$color"] -lt $number){
            $colorTable["$color"] = $number
            }
        }
    }
    
        

    
# Multiply here
    $GamePower = [int]$colorTable["red"] * [int]$colortable["Green"] * [int]$colortable["blue"]
     $totalpower += [int]$gamepower


}

$totalpower