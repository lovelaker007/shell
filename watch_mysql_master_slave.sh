#!/bin/bash

Mysql="mysql -uroot -poldboy123 -S /data/3307/mysql.sock"
function L_aaa(){
    Status=`$Mysql -e "show slave status\G" | grep -E "_Running: Yes|Seconds_Behind_Master: [0-2]" | wc -l`
    Code=`$Mysql -e "show slave status\G" | awk '/Last_SQL_Errno:/ {print $2}'`
}

function L_Status(){
    [ $Status -ne 3 ] && {
        return 1
    } || {
        return 0
    }
}

S_Code=(1158 1159 1008 1007 1062)
function L_Skip(){
    [ $Code -eq 0 ] && return 0
    
    for i in ${S_Code[*]}
    do
        [ $Code -eq $i ] && {
            $Mysql -e "stop slave; set global sql_slave_skip_counter = 1; start slave;" && \
            return 0
        }
    done
    return 1
}

function main(){
while true
    do
      L_aaa

      L_Skip
      Error1=$?

      L_Status
      Error2=$?
      [ $Error1 -eq 1 -o $Error2 -eq 1 ] && echo "Error"
    done
}
main
