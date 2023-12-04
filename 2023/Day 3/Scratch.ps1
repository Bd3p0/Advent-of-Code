'john123456smith' -replace "[^0-9]" , ''

123456


#bad answer = 8068304, 455338, 488501



$keys = 1,2,3,1 # Coordinates of good splats
$value = 'a value' #numbers of 
$hashtable = @{}

foreach($key in $keys){
  if(-not $hashtable.ContainsKey($key)){
    # First time we see this key, let's make sure the value is a resizable array
    $hashtable[$key] = @()
  }

  # Now we can safely add values regardless of whether the key already exists
  $hashtable[$key] += $value
}