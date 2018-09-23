#! /bin/bash

for f in $(ls | grep -E '*\..+'); do
    base_name=${f%.*}
    new_name=${base_name}.bak
    mv $f $new_name
done

