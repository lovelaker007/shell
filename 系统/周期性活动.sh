vim /etc/crontab 在里面增加下面内容：

50 16 * * * root rm -rf /abc/* 2>&1 &
00 8-18 * * * root cat /xyz/x1|awk '{print $1}' >> /backup/bak01.txt 2>&1 &
50 17 * * 1 root cd /data; tar -zcvf backup.tar.gz * 2>&1 &
55 17 * * * root umount /hdc 2>&1 &
