#! /bin/bash 

function fun1 {
	read -p "enter a number: " num

	if (( num < 100 )); then
		return $num
	else
		echo "if you"
	fi
}

#fun1
#echo "fun1 return $?"


# 定义函数function name(){}
# 调用 name 参数1 参数2 ...
    # 假如要向函数传递两个参数 var1='if you really' var2='[0-9]{5}'
    # fun1 var1 var2  这种传递方式, fun1接收到的参数中${1}=if ${2}=you
    # fun1 'var1' 'var2'  这种传递方式, fun1接收到的参数中${1}=var1 ${2}=var2
    # fun1 "var1" "var2"  这种传递方式, fun1接收到的参数中${1}=if you really ${2}=[0-9]{5}
# $0 表示函数名
# $1 表示第一个参数, 后面以此类推
# $? 上次函数调用的结果
# $# 函数参数的个数
# $* 函数所有的参数, '$*'表示$*字符串, "$*"将传入的参数看作一个整体
# $@ 在没有""时和$*一样, 加了""里面空格分割的字段可以被迭代   

# 在某个函数中定义的变量, 该函数结束后, 其他函数中仍然可以使用


function func2(){
    echo '参数 in $*'
    for i in $*; do
        echo $i
    done

    echo '参数 in "$*"'
    for i in "$*"; do
        echo $i
    done

    echo '参数 in "$@"'
    for i in "$@"; do
        echo $i
    done

    echo '参数 in $*(单引号)'
    for i in '$*'; do
        echo $i
    done

    echo '迭代双引号中的字符串'
    for i in "if you really want it"; do
        echo $i
    done

    echo '迭代ls结果'
    ls_result=$(ls)
    for i in $ls_result; do
        echo $i
    done

}
func2 1 3 4 5


