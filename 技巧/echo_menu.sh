#! /bin/bash

function menu(){
cat <<EOF
1.[install lamp]
2.[install lnmp]
3.[exit]
pls input the num you want:
EOF
read -p "please input number 1-3:" a

function lamp() {
    if [ -f /server/scripts/lamp.sh ];then
        echo "startinstalling lamp."
        sleep 2
        sh /server/scripts/lamp.sh
    else
        echo "file does not exist"
    fi
    exit 0
}

lnmp () {
    if [ -f /server/scripts/lnmp.sh ];then
        echo "startinstalling lnmp."
        sleep 3
        sh /server/scripts/lnmp.sh
    else
        echo "file does not exist"
    fi
    exit 0
}
case $a in
    1)
        lamp
    ;;
    2)
        lnmp
    ;;
    3)
        exit 0
    ;;
    *)
        echo "pls input the num you want:"
    ;;
esac
}

menu
