$data = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 2/Day-2-Input.txt'
$sampleData = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 2/Day-2-Sample.txt'
$badgames =@()
$TotalGames = 1..$data.count
# only 12 red cubes, 13 green cubes, and 14 blue cubes?
$maxColors = @{Red = 12; Green = 13; Blue =14 }


foreach ($games in $Data){
    $gameNumber = (($games -split(":"))[0] -split(' '))[1]
    $sets = ($games -split(':'))[1] -split(';')
    $setcount =0 
    
    
    
    foreach ($set in $sets){
       
        

        $colortable =[Ordered]@{
            "GameNumber" = $gameNumber
            "Set" = $setcount
            "Red" = 0
            "Green" = 0
            "Blue" = 0
        }
        $ColorNumberList = $set -split(',')
        $setcount ++
        $colortable["Set"] = $setCount
    

        foreach ($i in $ColorNumberList){
            $color,$number = $i.split(' ')[2..1]
            
            $colorTable["$color"] = $number
    
        }
      #  write-output $colortable['gamenumber']  $colortable['set'] `n

        foreach ($mcolor in $maxColors.keys){
            if( [int]$colorTable["$mcolor"] -gt [int]$maxcolors["$mcolor"]){
               $badgames += $colorTable["gamenumber"]  
            
            }
        }

    }
 }

 $badgames = $badgames | sort | uniq 


 $TotalGames = $TotalGames |Where-Object { $badgames -notcontains $_ }

 $ans = 0
 foreach ($game in $totalgames){
     $ans += $game
 }
 $ans
 
