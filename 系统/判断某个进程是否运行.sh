#! /bin/bash

function is_running(){
    a=$(ps -ef | grep python | grep -v 'grep')
    if [ -z a ]; then
        return 1
    else
        return 0
    fi
}

is_running
if [ $? ]; then
    echo 'python is running'
else
    echo 'python is not running'
fi


