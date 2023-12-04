$data = Get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 1/1-input.txt'
$calibrationData =@() 
$sampleData = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 1/sampleData.txt'
$Numbers = [ordered]@{
    twone = 21
    eightwo = 82
    eighthree = 83
    sevenine =79
    nineight = 98
    threeight = 38
    fiveight = 58
    oneight = 18
    one = 1 
    two = 2
    three = 3
    four = 4
    five = 5
    six = 6
    seven = 7
    eight = 8
    nine = 9


}
foreach ($DataPoint in $data){
    $intergers = @() 
    foreach ($n in $numbers.keys){
        $DataPoint = $DataPoint.replace($n, $Numbers["$n"])
    }
    $characters = $DataPoint.ToCharArray()
   
    foreach ($c in $characters){
        if ($c -match "^\d+$"){
            $intergers += $c
        }
    }
    $firstLast = $intergers[0] + $intergers[-1]
    $calibrationData += [int]$firstLast
}
$total = 0
foreach ($cData in $calibrationdata){
    $total = $total + $cData
}

Write-Output "The answer is $total"

