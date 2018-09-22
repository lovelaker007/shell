#! /bin/bash

function is_regex_match(){
    echo ${1} | grep -oE "${2}"
}

str='if you really 333333 want'
re='[0-9]{5}'

is_regex_match "$str" "$re"
(( $? == 0 )) && echo yes || echo no

