#!/bin/bash

[ -f /etc/init.d/functions ] && . /etc/init.d/functions
function check_httpd(){
    count=`ps -ef|grep nginx|grep -v grep|wc -l`
    if [ "$count" -ne 0 ]; then
        action "nginx is ok" /bin/true
    else
        action "nginx is dead" /bin/false
    fi
}
function check_httpd_port(){
    count=`netstat -lntup|grep 8080|wc -l`
    if [ "$count" -ne 0 ]; then
        action "nginx is ok" /bin/true
    else
        action "nginx is dead" /bin/false
    fi
}

check_httpd_port

