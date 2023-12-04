$data = Get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 1/1-input.txt'
$oddlist =@()
$combinedList = @("twone","eightwo","eighthree","sevenine","nineight")
foreach ( $d in $data){
  foreach ($c in $combinedList){
    if ($d -like "*$c*"){
      $oddlist +=  $d
    }

  }
  
  
    




}



