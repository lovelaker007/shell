#! /bin/bash

# read命令 read -option var_name
    # -p 指定提示输入文字
    # -t 指定限定的时间
    # -s 隐藏的方式读取, 用户的输入不在屏幕上显示
    # -u 指定获取输入的文件描述符
    # 如果没有指定变量存储用户的输入, 输入将会存储到REPLY环境变量中


:<<!
    一般情况下, 输入的单词数量和接收输入的变量数相等, 此时输入和变量一一对应
    但是在输入大于变量数的情况下, 最后一个变量会接收余下所有的输入
    相反, 只有排在前面的若干变量被赋值, 余下的变量全部为空
!

function REPLY_environ_var(){
    read -p "please enter something: "
    echo 'you enter: '$REPLY
    # 将输入放到一个数组中
    enter_list=($REPLY)
    echo 'you enter '${#enter_list[*]}' words'
}

function read_from_file(){
    num=1
    fd=7

    exec 7<mm_du
    while read -u7 line; do
        echo "line $num: $line"        
        num=$(( num+1 ))
    done

    # 另外一种写法, 不用专门打开文件建立文件描述符
    # while read -r line; do
        # echo line
    # done < mm_du
}

#REPLY_environ_var
read_from_file
