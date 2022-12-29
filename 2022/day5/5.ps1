$data = get-content /Users/OneDrive/Advent/2022/day5/5.txt

$container=@{}
$stacks = @{
1=1;2=5;3=9;4=13;5=17;6=21;7=25;8=29;9=33
}

foreach ($row in $data){
    if ($row[1] -notlike '1'){
        foreach ($position in $stacks.keys){
            if ($row[$stacks.$position] -ne ' '){
            $container.$position += $row[$stacks.$position]
            }
        }
    }
    else{  
        break
    }
 }    
 
foreach($instruction in $data){
    if($instruction -like "move*"){
        $step = $instruction.split(' ')
        [int]$SourceAmt = $step[1]
        [int]$SourceStack = $step[3]
        [int]$destStack = $step[5]

        foreach($i in 1..$SourceAmt){

            $container[$destStack] = $container[$sourceStack][0] + $container[$destStack]             
            $container[$sourceStack] = $container[$sourceStack].substring(1)                  
        }
    }
 }
 $ans =''
 $list = $container.keys | Sort-Object
foreach ($key in $list){
    if($container.$key){
    $ans += $container[$key][0]
    }
}
$ans