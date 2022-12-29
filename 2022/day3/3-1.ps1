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



foreach ( $ruck in $data ){
    $itemCount= ($ruck.ToCharArray()).count
    $divider = $itemCount/2
    $compartment1 = $ruck[0..($divider -1)] 
    $compartment2 = $ruck[$divider..$itemCount] 



    $itemList1 = @($compartment1 | Group-Object).name
    $itemList2 = @($compartment2 | Group-Object).name

    $dupeItems += $itemList1 |where-object { $itemList2.contains($_)} 


}
$ans = 0
foreach ( $i in $dupeItems){
    
   # ($priority | where {$_ -clike "$i*"}).split(' ')[1]

    $ans += ($priority | where {$_ -clike "$i*"}).split(' ')[1]

}
$ans