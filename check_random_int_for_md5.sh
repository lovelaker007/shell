#!/bin/bash

md5s=(21029299 00205d1c a3da1677 1f6d12dd)

for md5 in $md5s;do
    for((i=0; i<=32676; i++));do
        mm=$(echo $i | md5sum | cut -c 1-8)
        if [[ $mm == $md5 ]];then
            echo "$i->$md5"
            break
        fi
    done
done




