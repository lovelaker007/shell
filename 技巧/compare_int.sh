#! /bin/bash

function compare(){
    if (($1<$2)); then
        echo "$1<$2"
    elif (($1>$2)); then
        echo "$1>$2"
    else
        echo "$1=$2"
    fi
}

# 检测参数是否是整数
function is_int(){
    echo $1 | grep -E '^[0-9]+$' &>/dev/null
    if (($?!=0)); then
        echo "invalid arg: $1"  
        exit 1
    fi
}

function main(){
    if (($#==0)); then
        read -p 'please enter two int: ' num1 num2
        is_int $num1
        is_int $num2
        compare $num1 $num2
    elif (($#==2)); then
        is_int $1
        is_int $2 
        compare $1 $2
    else
        echo 'too many or two low args'
    fi
}

main $*
