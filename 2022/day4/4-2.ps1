$data = Get-Content /Users/OneDrive/Advent/2022/day4/4.txt
$count =0 
foreach ($d in $data){
    $workers =@()
    $workers += $d.split(',')
    
    
    $range0 =@()
    $range0 += $workers[0].split('-')
    [int]$low0 = $range0[0]
    [int]$high0 = $range0[1]
    $volume0=@($low0..$high0)
        
    $range1 =@()
    $range1 += $workers[1].split('-')
    [int]$low1 = $range1[0]
    [int]$high1 = $range1[1]
    $volume1=@($low1..$high1)    
    
    $test = ''
    $test = $volume0 |where-object { $volume1.contains($_)} 

    if($test){
        $count++
    }

}
$count