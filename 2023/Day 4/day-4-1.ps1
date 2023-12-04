$data = Get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 4/day-4-input.txt'
$total = 0

foreach ($line in $data){

    $card = ($line.split(':')[1])
    $winningNumbers = ($card.split('|')[0]).split(' ') | where-object {$_ -ne ''}
    $scratchNumbers = ($card.split('|')[1]).split(' ') | where-object {$_ -ne ''}
    $allNumbers = $winningNumbers + $scratchNumbers 

    #Group allnumbers and look at count for matches
    $match = (($allNumbers | Group-Object | where-object {$_.count -ge 2}).name).count

    if ($match -gt 0){
        $exponent = $match -1 
        $cardScore = [Math]::Pow(2,[int]$exponent)
    }
    else {
        $cardscore = 0
    }
    $total += $cardscore
}
$total
