#! /bin/bash

USER=oldboy
function add(){
	for i in {01..10}; do
        username=$USER$i
		passwd=$(tr -dc 'a-z' < /dev/urandom | head -c 8)
		useradd $username
        echo $username:$passwd | chpasswd
		echo $username----$passwd >> userpasswd
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

echo $0
echo $1
main $1
