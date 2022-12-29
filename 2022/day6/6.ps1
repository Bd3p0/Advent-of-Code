$data = get-content /Users/OneDrive/Advent/2022/day6/6.txt

$total = $data.ToCharArray().count -1

foreach ($i in 0..$total){

if ((($data[$i..($i+3)] | Group-Object).name).count -gt 3){
    $data[$i..($i+3)] | Group-Object
    break
}
}
$i + 4 