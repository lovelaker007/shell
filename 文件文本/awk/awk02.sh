#! /bin/bash

echo 'the origin'
cat awk02
echo

cat awk02 | awk '{
    key = $1FS$2FS$3;
    a[key] += $4;
    b[key] = b[key] ? b[key]";"$5 : $5;
}
END{
    print "after: "
    for(i in a){
        print i, a[i], b[i] 
    }
}
'



