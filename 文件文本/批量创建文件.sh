#! /bin/bash

function create(){
    base_name='_oldboy.html'
    for ((i=0; i<10; i++)); do
        name=$(tr -dc a-z < /dev/urandom | head -c 10)
        touch $name$base_name
    done
}

function rename(){
    files=$(ls | grep 'oldboy.html')
    for f in $files; do
        first_name=${f:0:10}
        mv $f ${first_name}_oldgirl.HTML
    done
}

case $1 in
    "create")
        create
        ;;
    "rename")
        rename
        ;;
    *)
        echo "useage: $0 create|rename"
        ;;
esac

