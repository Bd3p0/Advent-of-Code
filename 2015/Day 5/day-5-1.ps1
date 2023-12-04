$data = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2015/Day 5/day-5-input.txt'
$sampleData = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2015/Day 5/day-5-sample.txt'
<#NICE:
It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.#>



$vowels =@("a","e","i","o","u")
$badStrings=@("ab","cd","pq","or","xy")
$StringLog =@{} ; $count =0 ; $GoodList =@()


foreach ($line in $Data){
   $Stringlog[$line] = @{}
    #Test 1
    $vowelCount = $line.tochararray() | group | where-object name -in $vowels
    if ($vowelcount.count -ge 2){
        #Check 1 passes
        
        
    
    

        #Test 2 Doubles
        $doublecheck = $line.tochararray() | group  | where count -ge 2 
        foreach ($letter in  $doublecheck.name){
            if ($line -like "*$letter$letter*"){
                #Check 2 Passes
                $goodlist += $Line
            
                #Test 3 Bad List
                foreach ($set in $badstrings){
                    if ($line -like "*$set*"){

                        $goodlist = $goodlist | where-object {$_ -notlike $line}
                    }
                }
            }

        }
            

    
     }
           
    }   

$goodlist.count
