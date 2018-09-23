#! /bin/bash

echo "before exec/source/fork: PID for 1.sh = $$"

A=1
export A
echo "In 1.sh: variable A=$A"

case $1 in
        --exec)
                echo -e "==> using exec…\n"
                exec ./2.sh ;;
        --source)
                echo -e "==> using source…\n"
                . ./2.sh ;;
        *)
                echo -e "==> using fork by default…\n"
                ./2.sh ;;
esac

echo "after exec/source/fork: PID for 1.sh = $$"
echo -e "In 1.sh: variable A=$A\n"

:<<!
fork	新开一个子 Shell 执行，子 Shell 可以从父 Shell 继承环境变量，
        但是子 Shell 中的环境变量不会带回给父 Shell。
exec	在同一个 Shell 内执行，但是父脚本中 exec 行之后的内容就不会再执行了
source	在同一个 Shell 中执行，在被调用的脚本中声明的变量和环境变量, 
        都可以在主脚本中进行获取和使用，相当于合并两个脚本在执行。
!
