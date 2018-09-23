#! /bin/bash

:<<!
循环
for i in $(seq 1 10); do
    echo $((i * 2))
done
echo 'finish'

for (( i=0; i<100; i++ )); do
    if (( (i % 2) == 0 )); then 
        echo $i
    fi
done
echo 'finish'

for (( i=0; i<100; i++ )); do
    if [ $((i % 2)) -eq 0 ]; then
        echo $i
    fi
done
echo 'finish'

条件语句
if []; then
    commands
elif []; then
    commands
else
    commands
fi

!

files=$(du -a)
file_list=($files)
len=${#file_list[*]}
echo $len

for(( i=0; i<len; i=i+2 )); do
	if (( ${file_list[$i]}>4 )) && [ -f "${file_list[$((i+1))]}" ]; then
		echo ${file_list[$((i+1))]}
	fi	
done

echo 'finish'

# 三种循环
i=20
until(( i<10 )); do
    echo $i
    i=$((i-1))
done

