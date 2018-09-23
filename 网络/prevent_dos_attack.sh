#! /bin/bash

log=/tmp/tmpip.log
[ -f $log ] || touch $log

function check(){
    netstat -atun | grep 'EST' | awk '{print $(NF-1)}' | awk -F ':' '{print $1}' | 
    sort | uniq -c > $log
}

function prev(){
	while read -r line; do
		count=$(echo $line | awk '{print $1}')
		ip=$(echo $line | awk '{print $2}')

		if (( count >= 100 )) && (( $(iptables -L -n | grep "$ip" | wc -l) == 0 )); then
			iptables -t FILTER -I INPUT -j DROP -s $ip
		fi
	done < $log
}

function main(){
    while true; do
	    check 
	    prev
	    sleep 180
    done        
}


main
