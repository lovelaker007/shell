#! /bin/bash

function func1(){
    cat /etc/passwd | awk -F ':' '{
        a[$NF]++;
        b[$NF] = b[$NF] ? b[$NF]";"$1 : $1;
    }
    END{
        for(i in a){
            print i, a[i], b[i]
        }
    }
    '    
}

func1
