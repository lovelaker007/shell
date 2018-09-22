#! /bin/bash

WORK_DIR=./random
function change(){
	files=$(ls $WORK_DIR)
	cd $WORK_DIR
	for file in $files; do
		mv $file ${file:0:10}_oldgirl.HTML
	done
}

function check(){
	if [ -d $WORK_DIR ]; then
		change
	else
		echo "the dir $WORK_DIR contains file does not exsits"
		exit -1
	fi
}

check