#! /bin/bash

awk '
{
    for(i=2; i<=NF; i++){
        a[$1] = a[$1] ? a[$1]"_"$i : $i        
    }
}
END{
    for(m in a){
        print m, a[m] 
    }
}
' employee bonus

