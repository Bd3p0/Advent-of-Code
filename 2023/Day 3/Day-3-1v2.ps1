
$data = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 3/Day-3-input.txt'
$sampledata = get-content '/Users/bd3p0/Library/CloudStorage/OneDrive-Personal/Documents/Advent of Code/2023/Day 3/Day-3-Sample.txt'
$rowcount = 0
$allCoords =@()
$dotcoords =@()
$NumberCoords = @()
$SpecCoords =@()
$numbers = @()
# x = column/position $y = row
$x =0 ; $y = 0 

#Plot Everything 
foreach ($line in $data){
    
    $numbers += ($line -replace "\W", "`n").split("`n") |where-object {$_.trim() -ne ''}
    $x=0
    foreach ($char in $line.tochararray()){
        switch ($char) {
            {$char -notmatch "^\d+$" -and $char -notlike '.'} { $specCoords += "$x,$y"; $allCoords += "$x,$y"}
            {$char -match "^\d+$"} {$NumberCoords += "$x,$y"; $allcoords += "$x,$y"}
            {$char -like '.'}{$dotcoords +="$x,$y"; $allcoords += "$x,$y"}
        }

    $x++
    }
$rowcount++; $y++
}
# While allcoords does not match special character or dotcoords add to a number 3d array
$count = 1
$numHash =@{}
$numarray =@()
foreach ($i in $allcoords){
   
    if ($dotcoords -notcontains $i -and $SpecCoords -notcontains $i){
        
        $numarray += $i
    }
    else{ 
         if ($numarray.count -eq 0){} 
         else{
         $numhash.add($count, $numarray) 
         $count ++ 
         $numarray =@()
         }
        }

}
$nearBy = @("-1,-1") ,("-1,0"), ("-1,1"), ("0,-1") , ("0,1") ,("1,-1") ,("1,0") , ("1,1")
#next step to compare numberhash to $specarray for  +- 1 in coords ( both x and y have to be withing +- 1)
$temphash = $numhash
$goodNums =@()
foreach ($sc in $SpecCoords){
    [int]$sx,[int]$sy = $sc.split(',')
     foreach ($near in $nearby){
        [int]$nx,[int]$ny = $near.split(',')

          $xx = ($nx + $sx)
          $yy = ($ny + $sy)
          
          foreach ($key in $numhash.keys){
                if("$xx,$yy" -in $numhash[$key]){
                #write-output "$xx,$yy : $key"
                  $goodNums += ([int]$key -1)
                  # $goodnums | Sort | uniq
                 }
                 
    
    }
}

}
$list=@()
$list += $goodnums | Sort | uniq
$final =@()
$total =0
foreach ($num in $list){

    $final += $numbers[$num]
    $total += $numbers[$num]


}

#$final |? {$_ -ne ''}  
$total