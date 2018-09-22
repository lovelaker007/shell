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

check $1 $2
echo $?