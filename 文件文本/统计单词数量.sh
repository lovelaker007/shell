#! /bin/bash
# 对每行文本, 先截取处要统计的部分, 再排序计数


:<<!
    给出一个文本比如 
    http://aaa.com
    http://bbb.com
    http://bbb.com
    http://bbb.com
    http://ccc.com
    http://ccc.com

    让写 shell 统计，最后输出结果：
    aaa 1
    ccc 2
    bbb 3

    要求结果还要排序
!

function func1(){
    touch tmp
    while read -r line; do
        a=${line#*//}
        doman=${a%.com}
        #echo $doman
        echo $doman >> tmp
    done <file1

    cat tmp | sort | uniq -c | \
    awk '{print $2" "$1}'    
    rm tmp
}

func1
