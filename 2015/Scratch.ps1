$count = 0

Foreach ( $i in 1..100){
$count++
switch ($count %2) {
     1{echo 1}
     0{echo 0}
}





}