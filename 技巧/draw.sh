#! /bin/bash

function draws(){
	for (( m=0; m<$2; m++ )); do
		printf "$1"
	done
}

function new_line(){
	printf "\n"
}

function dengyaosanjiao(){
	for (( i=1; i<=$1; i++ )); do
		num_kongge=$(( $1-i ))
		num_jinhao=$(( 2*(i-1)+1 ))
		# echo $i $num_kongge $num_jinhao

		draws ' ' num_kongge
		draws '#' num_jinhao
		new_line
	done
}

for n in $(seq 1 10);do
	dengyaosanjiao $n
done


