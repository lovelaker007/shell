#! /bin/bash

while [ 1 ]; do
	read -p 'please enter a word: ' word
	case $word in
		quit)
			echo 'goodbye'
			exit 0
		;;
		*)
			echo 'you enter:' $word
		;;
	esac
done
			

