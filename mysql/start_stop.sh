#! /bin/bash

mysql_user="root"
mysql_passwd="passwd"
base_dir="/data/"

function check(){
	command_array=('start' 'stop' 'restart')
	port_arrty=(3306 3307)

	for i in ${command_array[*]}; do
		if [[ $i == $1 ]]; then
			for j in ${port_arrty[*]}; do
				if [[ $2 == $j ]]; then
					return 0
				fi
			done
			return -1
		fi
	done
	return -1	
}

function start(){
	if [ -f ${base_dir}$1/mysqld.pid ]; then
		echo "mysql is running on port" $1 
	else 
		mysqld
	fi

}


function in_array2(){
	a=(1 2 3 4)
	b=2

	for i in ${a[*]}; do
		if [[ $i == $b ]]; then
			return 0
		fi
	done
	return -1
}

function main(){
	check $1 $2
	echo $?
	if (( $? != 0 )) ; then
		echo "useage: $0 start|stop|restart 3306|3307"
		return -1
	fi

	case $1 in
		start)
			start $2	
		;;
		stop)
			stop $2	
		;;
		restart)
			restart $2	
		;;
		*)
			echo "useage: $0 start|stop|restart 3306|3307"
			return -1
		;;
	esac

}

main