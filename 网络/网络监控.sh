# 查看tcp状态
netstat -nat |awk ‘{print $6}’|sort|uniq -c|sort -rn


    
