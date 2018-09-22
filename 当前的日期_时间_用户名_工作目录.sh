#! /bin/bash

echo '日期: ' $(date +%Y-%m-%d)
echo '时间: ' $(date +%H:%M:%S)
echo '当前用户: ' $(whoami)
echo '当前工作目录: ' $(pwd)

IP=`ifconfig | grep "inet 地址:" |sed '/127/d' | awk '{print $2}' | awk -F : '{print $2}'`
#掩码
MASK=`ifconfig | grep "inet 地址:" |sed '/127/d' | awk -F : '{print $4}'`
echo $IP"/"$MASK


