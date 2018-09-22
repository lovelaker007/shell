#! /bin/bash

function client(){
	fifo=/tmp/wwh.fifo
	touch $fifo
	sed -i 'd' $fifo
	exec 7>$fifo

	while [ 1 ]; do
		read -p 'please enter a word: ' word
		case $word in
			quit)
				echo 'goodbye'
				echo $word >&7
				# exec 7>$-
				exit 0
			;;
			*)
				echo 'you enter:' $word
				echo $word >&7
			;;
		esac
	done
}

client


# exec fd<>/path/to/file  可读写的方式打开file, 文件描述符为fd
# exec fd<&-  关闭文件描述符
# read -u fd_num  从指定的描述符读取
# echo 'something' >&fd_num  向文件描述符的开头写入
# echo 'something' >>filename  不用打开文件, 直接添加到文件结尾

