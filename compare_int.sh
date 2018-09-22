#! /bin/bash

function compare(){
    echo $# $*
    # 检测参数是否是整数
    echo $1 | grep '^[0-9]\+$' &>/dev/null
    if (($?!=0)); then
        echo "invalid arg: $1"  
        exit 1
    fi

    echo $2 | grep '^[0-9]\+$' &>/dev/null
    if (($?!=0)); then
        echo "invalid arg: $2 "  
        exit 2
    fi

    if (($1<$2)); then
        echo "$1<$2"
    elif (($1>$2)); then
        echo "$1>$2"
    else
        echo "$1=$2"
    fi
}

function main(){
    if (($#==0)); then
        read -p 'please enter two int: ' num1 num2
        compare $num1 $num2
    elif (($#==2)); then
        compare $1 $2
    else
        echo 'too many or two low args'
    fi
}

main $*
