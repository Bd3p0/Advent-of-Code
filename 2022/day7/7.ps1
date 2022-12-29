$data = get-content /Users/OneDrive/Advent/2022/day7/7sample.txt
$directoryList =@(); $instructionSets = @()



ForEach ( $instruction in $data){
    if ($instruction -like "$ cd*") {
        $instructionSets += [PSCustomObject]@{  Instructions = $tempObj  }
    $tempObj = @()
    $tempObj += $instruction
    
   } 
   else {
       $tempObj += $instruction
   }
}
$instructionSets += [PSCustomObject]@{  Instructions = $tempObj  } #used to add the last step to list


#create Directories
foreach ($set in $instructionSets) {
    foreach ($step in $set.Instructions) {
        switch ($step) {
            #switch 1
            { $_ -like "$ cd*" -and $_ -notlike "*..*" } {
                $dir = $_.split(" ")[2]
                if ($directoryList.directory -notcontains "$dir") {
                    $directoryList += [PSCustomObject]@{
                        Directory = $dir
                        contents  = [System.Collections.ArrayList]@()
                        size = 0
                    }
                }           
            }        
        
            #switch 2
            { $_ -like "*dir*" } {
                $dir = $_.split(" ")[1]
                if ($directoryList.directory -notcontains "$dir") {
                    $directoryList += [PSCustomObject]@{
                        Directory = $dir
                        contents  = [System.Collections.ArrayList]@()
                        size = 0
                    }
                }
            }
                   
        }
    }
}

#fill directories with Content
foreach ($set in $instructionSets) {
    $dir = ($set.instructions[0].split(' ')[2])
    foreach ($step in $set.Instructions) {
        switch ($step) {
            { $_ -notlike "$ cd*" -and $_ -notlike "*..*" -and $_ -notlike "$ ls" } {
                ($directoryList | where-object { $_.Directory -like $dir }).contents += $step
                $firstSection = ($step.split(' '))[0]
                try {
                    if ( [int]$firstSection -is [int]) {
                        ($directoryList | where-object { $_.Directory -like $dir }).size += [int]$firstSection
                    }
                }
                Catch{}
            }
        }
    }
}



$directoryList
#$directorylist | where-object {$_.size -lt 100000}
