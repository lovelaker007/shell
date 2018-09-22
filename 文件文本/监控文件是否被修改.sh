#!/bin/bash

random_dir='/tmp/random'
check_file_1='/tmp/randomfile_md5sum1'
check_file_2='/tmp/randomfile_md5sum2'

[ -f $check_file_1 ] || touch $check_file_1
[ -f $check_file_2 ] || touch $check_file_2

function md5sum_for_random_file(){
    for i in $(find $random_dir -type f); do
        md5sum $i >> $check_file_1
    done
}

function check(){
    result=$(md5sum -c $check_file_1 2>/dev/null | grep '失败') 
    result_list=($result)
    for((i=0; i<${#result_list[*]}; i=i+2)); do
        item=${result_list[i]}
        echo ${item:0:((${#item}-1))} '发生改变'
    done
}

function main(){
    md5sum_for_random_file
    check
}
 
main
