$data = get-content /Users/OneDrive/Advent/2022/day6/6.txt

$total = $data.ToCharArray().count -1

foreach ($i in 0..$total){

if ((($data[$i..($i+13)] | Group-Object).name).count -gt 13){
    $data[$i..($i+13)] | Group-Object
    break
}
}
$i + 14 