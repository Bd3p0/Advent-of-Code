$data = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2015/Day 4/Day-4-input.txt'
$number = 1
$hash = "xxxxx"


while (($hash[0..4] -join('')) -ne "00000"){
    $inputData = "$data" + "$number"

    $hash = (Get-FileHash -Algorithm MD5 -InputStream ([IO.MemoryStream]::new([Text.Encoding]::UTF8.GetBytes($inputdata)))).hash
    $number++
}
 $hash
 $inputdata
 $number -1
 