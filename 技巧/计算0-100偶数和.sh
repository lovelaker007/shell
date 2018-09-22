#! /bin/bash

function func1(){
    sum=0
    for n in $(seq 0 100); do
        if (( n%2 == 0 )); then
            sum=$(( sum+n ))
        fi
    done
    echo $sum
}

func1
