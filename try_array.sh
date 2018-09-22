#! /bin/bash

a=(1 2 3 4)

# 从旧的array中构造新的array
function new_array(){
	new_array=()
	index=0

	for i in $*; do
        new_array[index]=$(( i*3 )) 
        index=$(( index+1 ))
	done

    echo ${new_array[*]}
}

function in_array(){
    for i in $1; do
        if [[ $i == $2 ]]; then
            return 0
        fi
    done
    return 1
}

echo ${a[*]} 
b=($(new_array "${a[*]}"))
echo ${b[*]}

in_array "${a[*]}" "5"
(( $? == 0 )) && echo 'yes' || echo 'no'

# 在数组末尾增加一个元素
c=(${a[*]} 555)
echo ${c[*]}


:<<!
    用命令的结果生成数组时, 无论结果是多行的, 还是一行多个字段的, a=($(command))都可以将结果放到数组中
    数组切片${a[*]:start:length}
    函数无法返回数组, 只能用echo ${array_name[*]}的形式将数组中的元素都写出
!
