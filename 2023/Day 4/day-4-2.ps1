
$data = Get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 4/day-4-input.txt'
$total = 0
$lineNumber = 1; $count=1
$deckinfo =@{}

#Build the Deck - Each card based off line number and starting count of 1 
foreach ($d in $data){
    $deckinfo.add($count, 1) 
    $count++
}


foreach ($line in $Data){
    
    $card = ($Data[$lineNumber -1]).split(':')[1]
    $winningNumbers = ($card.split('|')[0]).split(' ') | where-object {$_ -ne ''}
    $scratchNumbers = ($card.split('|')[1]).split(' ') | where-object {$_ -ne ''}
    $allNumbers = $winningNumbers + $scratchNumbers 

    #Groups all numbers and selects the ones equal to 2 , and counts them
    $match = (($allNumbers | group-object | where-object {$_.count -ge 2}).name).count
    
   #If the card has a match, iteratate for how many cards are in the deck, and add other cards afterwards
   if ($match -gt 0){
    foreach ($card in 1..$deckinfo[$lineNumber]){
        foreach ($m in 1..$match){
            $newLine = $LineNumber + $m
            $deckinfo[$newLine]= $deckinfo[$newline] + 1
        } #end Foreach
   }#end Foreach
}#end IF

$lineNumber++
}
#Counting the cards in the deck.
foreach ($key in $deckinfo.keys){
    $total += $deckinfo[$key]
}
$total
