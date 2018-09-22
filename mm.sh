#! /bin/bash

file_or_dir=($(ls ../sh))
for i in ${file_or_dir[*]}; do
	cp -R ../sh/$i .
done