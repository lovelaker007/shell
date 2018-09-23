#! /bin/bash

for f in $(du . -a | awk '$1>4 {print $2}'); do
	if [ -d $f ]; then
		continue
	fi
	echo $f
done
