$data = get-content /Users/OneDrive/Advent/2022/day2/2.txt

$handValues =@{
    AX='D' ; AY='W'; AZ='L'
    BX='L' ; BY='D'; BZ='W'
    CX='W' ; CY='L'; CZ='D'
}


$score = 0 

foreach($hand in $data){
    $compare = $hand.split(' ') -join('')
    $outcome = $handValues[$compare]
    
    switch ($outcome) {
        W { $score += 6 }
        L { $score += 0 }
        D { $score += 3 }
    }
    $myhand = $hand.split(' ')[1]

        switch ($myhand) {
            'X' { $score += 1 }
            'Y' { $score += 2 }
            'Z' { $score += 3 }
        }
}
$score