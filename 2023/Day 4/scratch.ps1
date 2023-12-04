$sampledata = Get-Content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 4/day-4-sample.txt'

$line = $sampledata[3]

$card = ($line.split(':')[1])
$winningNumbers = ($card.split('|')[0]).split(' ') | where-object {$_ -ne ''}
$scratchNumbers = ($card.split('|')[1]).split(' ') | where-object {$_ -ne ''}
$allNumbers = $winningNumbers + $scratchNumbers 

#Group allnumbers and look at count for matches
$match = (($allNumbers | group | where-object {$_.count -ge 2}).name).count
 write-output "Match = $match.count"


   $exponent = $match.count -1 
    $cardScore = [Math]::Pow(2,[int]$exponent)
    


    write-output $cardscore

$total += $cardscore