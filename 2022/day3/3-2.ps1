$data = get-content /Users/OneDrive/Advent/2022/day3/3.txt
$dupeItems = @()
$letters = ('a'..'z' )+('A'..'Z')
$priority =@()
$count = 1
foreach ($letter in $letters){
    $pair = @($letter ,$count)
    $priority += "$pair"
    $count ++
}

$team =@()
$total = $data.count
#foreach ( $ruck in (0..$data.count -1 ) ){}
  <#  $itemCount= ($ruck.ToCharArray()).count
    $divider = $itemCount/2
    $compartment1 = $ruck[0..($divider -1)] 
    $compartment2 = $ruck[$divider..$itemCount] 
#>
for ($i = 0; $i -lt $total; $i += 3) {
    $team =@()
    $team += $data[$i]
    $team += $data[$i +1]
    $team += $data[$i +2]

    $elf0 = ($team[0].ToCharArray() | Group-Object ).name
    $elf1 = ($team[1].ToCharArray() | Group-Object ).name
    $elf2 = ($team[2].ToCharArray() | Group-Object ).name
   # $itemList1 = @($compartment1 | Group-Object).name
   # $itemList2 = @($compartment2 | Group-Object).name

    $dupe1 = $elf0 |where-object { $elf1.contains($_)} 
    $dupe2 = $dupe1 | where-object {$elf2.contains($_)}
$dupeItems += $dupe2

}
$ans = 0
foreach ( $i in $dupeItems){
    
   # ($priority | where {$_ -clike "$i*"}).split(' ')[1]

    $ans += ($priority | where {$_ -clike "$i*"}).split(' ')[1]

}
$ans