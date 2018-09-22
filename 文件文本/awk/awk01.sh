#! /bin/bash

origin='stra b\nstra c\nstra d\nstrb 1\nstrb 2\nstrb 3'
echo 'the origin is'
echo -e $origin
echo 

echo -e $origin | awk '
{
    # a是数组
    if(!a[$1]){
        # ""是字符串拼接操作符, 此处的操作是将$1空格$2连接在一起
        a[$1]=$1 "" " " "" $2
    } else {
        a[$1]=a[$1]""$2
    }
}
END{
    print "after 处理"
    for(m in a){
        print a[m]
    }
}
'
