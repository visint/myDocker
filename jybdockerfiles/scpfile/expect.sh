#!/bin/sh
  
# 匹配提示符  
CMD_PROMPT="\](\$|#)"  
  
# 要执行的脚本  
script="/root/test.sh"  
  
username="root"  
password="123456"  
host="192.168.1.109"  
port=22  
  
expect -c "  
    send_user connecting\ to\ $host...\r  
    spawn ssh -p $port $username@$host  
    expect -re $CMD_PROMPT  
    send -- $script\r  
    expect -re $CMD_PROMPT  
    exit  
"  
echo "\r"

