#!/bin/bash

function input(){
    int_list=()
    while true; do
        read -p 'please enter your name, enter "quit" to quit: ' name
        if [ -z $name ]; then
            continue
        elif [[ $name == "quit" ]]; then
            break
        else
            random_int=$((RANDOM%100))
            echo "your name is $name, random_int is $random_int"
            echo "$random_int $name" >> $random_int_file
        fi
    done
}

function output(){
    cat $random_int_file | sort -n -r | head -n 3
}

function main(){
    # 将字符串的每个字符放到数组中
    l=()
    for i in 'if you really want it'; do
        l=(${l[*]} $i)
    done
    echo ${l[*]}


    random_int_file=random_int
    [ -e $random_int_file ] || touch $random_int_file

    input
    output
    rm $random_int_file
}

main

