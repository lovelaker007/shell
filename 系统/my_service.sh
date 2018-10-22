#! /bin/bash

pidfile=/var/run/my_service.pid
status="-e ${pidfile}"

function start(){
    if [ ${status} ]; then
        echo 'service is running'
    else
        my_service_bin start &
        if [ ${status} ]; then
            echo 'start my_service done'
        else
            echo 'something wrong starting my_service'
        fi
    fi
}

function stop(){
    if [ ${status} ]; then
        #pid=$(ps -ef | grep 'my_service_bin' | grep -v 'grep' | awk '{print $2}')
        #kill -9 ${pid}
        #rm -f ${pidfile}
        my_service_bin stop
        if [ ${status} ]; then
            echo 'someting wrong stopping my_service'
        else
            echo 'stop my_service done'
        fi
    else
        echo 'my_service has already been stopped'
    fi
}

function status(){
    if [ ${status} ]; then
        echo 'my_service is running'
    else
        echo 'my_service is not is_running'
    fi
}

function restart(){
    if [ ${status} ]; then
        stop 
        sleep 1
        start
    else
        start
    fi
}

case $1 in
    "start")
        start
        return
    "stop")
        stop 
        return
    "restart")
        restart
        return
    "status")
        status
        return
    *)
        echo 'useage: my_service.sh start/stop/restart/status'
        return
esac
