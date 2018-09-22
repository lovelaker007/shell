#! /bin/bash

USER=oldboy
function add(){
	for i in {01..10}; do
		passwd=$( tr -dc 'a-z' < /dev/urandom | head -c -n 8 )
		useradd $USER$i
		echo $passwd | passwd $USER$i --stdin
		echo $USER$i----$passwd >> userpasswd
	done
}

function del(){
	for i in {01..10}; do
		userdel -rf $USER$i
	done
}

function main(){
	case $1 in
		add )
			add
			return
		;;
		del )
			del
			return
		;;
		* )
			echo "useage: $0 add or del"
			return
		;;
	esac
}

main