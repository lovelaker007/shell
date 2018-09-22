#! /bin/bash

s="i am a oldbys teacher welcome to china"
for word in $s; do
	if ((${#word} >= 5)); then
		echo $word
	fi
done
