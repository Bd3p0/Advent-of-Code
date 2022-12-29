$data = get-content /Users/OneDrive/Advent/2022/day2/2.txt
#rock = 1 AX
#paper = 2 BY
#scissors = 3 CZ

$handscore =@{
    A=1;B=2;C=3
}


$score = 0 

foreach($hand in $data){


    $theirhand,$myhand = $hand.split(' ')
    
    switch ($myhand) {
            'X' { $score += 0 ; $score += ($handscore[$theirhand]+2)%3} # Lose4
            'Y' { $score += 3 ; $score += ($handscore[$theirhand]) } # Draw
            'Z' { $score += 6 ; $score += ($handscore[$theirhand]+1)%3 } # Win
        }


 
}
$score