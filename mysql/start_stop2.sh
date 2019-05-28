#! /bin/bash

USER=root
PASSWD=root

# 检测mysql是否存活一种方法
function check(){
    num=$(ps -ef | grep mysqld | grep -v grep | wc -l)
    echo $num
    if (( num == 0 )); then
        echo 'no mysql'
        return 0
    else
        echo 'already mysql'
        return 1
    fi
}

# 检测的另一种方法
function check2(){
    status=$(systemctl status mysqld | grep Active | awk '{print $2}')
    if [[ $status == inactive ]]; then
        echo 'no mysql'
        return 0
    else
        echo 'already mysql'
        return 1
    fi
}

function start(){
    check2
    if (( $? == 1 )); then
        echo 'already mysql' 
        return 0
    fi

    systemctl start mysqld
    check2
    if (( $? == 1 )); then
        echo 'start mysqld success' 
        return 0
    else
        echo 'something wrong start mysqld'
        return 1
    fi            
}

function main(){
    # [ -z $2 ] && echo "Useage: $1 start/stop/restart"
    if [ -z $2 ]; then
        echo "Useage: $1 start/stop/restart"
        return
    fi

    case $2 in
    start)
        start
    ;;
    stop)
        stop
    ;;
    restart)
        restart
    ;;
    *)
        echo "Useage: $1 start/stop/restart"  
    ;;
    esac
}


#main $0 $1
check2
