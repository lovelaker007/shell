#! /bin/bash
# 用awk进行统计

:<<!
某个目录下有两个文件a.txt和b.txt，文件格式为(ip username)，例如：

a.txt
127.0.0.1 zhangsan
127.0.0.1 wangxiaoer
127.0.0.2 lisi
127.0.0.3 wangwu    

b.txt
127.0.0.4 wangwu
127.0.0.1 lisi

每个文件至少有100万行，请使用linux命令行完成如下工作：
1）两个文件各自的ip数，以及总ip数
2）出现在b.txt而没有出现在a.txt的ip
3）每个username出现的次数，以及每个username对应的ip数

---------------------
!

function func1(){
    ip_in_a=$( cat ipa | awk '{print $1}' | sort | uniq | wc -l )
    ip_in_b=$( cat ipb | awk '{print $1}' | sort | uniq | wc -l )
    ips=$( cat ipa ipb | awk '{print $1}' | sort | uniq | wc -l )
    echo "there are $ip_in_a ips in a.txt"
}

# 第三问, 每个user对应的ip数量
function func3(){
    cat ipa ipb | \
    awk '
    {
        # 定义两个数组a, b；分别用于存放user对应的ip和ip的数量
        a[$2] = a[$2] ? a[$2]" "$1 : $1        
        b[$2] += 1
    }
    END{
        for(m in a){
            printf "user: %s    ip count: %d\n", m, b[m] 
            printf "\tip: %s\n", a[m]
        }
    }
    ' 
}

func3
