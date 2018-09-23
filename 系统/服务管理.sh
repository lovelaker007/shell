#! /bin/bash

:<<!
写网络服务独立进程模式下rsync的系统启动脚本 
例如：/etc/init.d/rsyncd{start|stop|restart}。 
要求： 
1.要使用系统函数库技巧。 
2.要用函数，不能一坨SHI的方式。 
3.可被chkconfig管理。
!

# Comments to support chkconfig on RedHat Linux
# chkconfig: 2345 64 36
status1=$(ps -ef | egrep "rsync --daemon.*rsyncd.conf" | grep -v 'grep')
pidfile="/etc/rsync/rsyncd.pid"
start_rsync="rsync --daemon --config=/etc/rsync/rsyncd.conf"

# 打开一项服务
# 检查是否已经打开(是否有pid文件)
# 打开服务
# 检查是否成功打开
function rsyncstart() {
    if [ "${status1}X" == "X" ];then
        rm -f $pidfile
        ${start_rsync}
        status2=$(ps -ef | egrep "rsync --daemon.*rsyncd.conf" | grep -v 'grep')
        if [  "${status2}X" != "X"  ]; then
            echo "rsync service start.......OK"
        else
            echo "something wrong starting rsync service"
        fi
    else
        echo "rsync service is running !"
    fi
}

function rsyncstop() {
    if [ "${status1}X" != "X" ];then
        kill -9 $(cat $pidfile)
        status2=$(ps -ef | egrep "rsync --daemon.*rsyncd.conf" | grep -v 'grep')
        if [ "${statusw2}X" == "X" ];then
            echo "rsync service stop.......OK"
        else
            echo "something wrong stopping rsync service"
        fi
    else
        echo "rsync service is not running !"
    fi
}

function rsyncstatus() {
    if [ "${status1}X" != "X" ];then
        echo "rsync service is running !"
    else
         echo "rsync service is not running !"
    fi
}

function rsyncrestart() {
    if [ "${status1}X" == "X" ];then
               echo "rsync service is not running..."
               rsyncstart
        else
               rsyncstop
               rsyncstart
        fi
}
case $1 in
    "start")
           rsyncstart
            ;;
    "stop")
           rsyncstop
            ;;
    "status")
           rsyncstatus
           ;;
    "restart")
           rsyncrestart
           ;;
    *)
      echo
            echo  "Usage: $0 start|stop|restart|status"
      echo
esac

:<<!
将判断某个进程是否正在运行打包成一个函数
    function is_running(){
        a=$(ps -ef | grep python | grep -v 'grep')
        if [ -z a ]; then
            return 1
        else
            return 0
        fi
    }
!
