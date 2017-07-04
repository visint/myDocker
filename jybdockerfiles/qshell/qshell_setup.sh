#!/bin/sh
if [ -f "/usr/sbin/qshell" ]; then
        echo "qshell is exist"
else
        wget http://devtools.qiniu.com/2.0.8/qshell-linux-x64 -O /usr/sbin/qshell && chmod 777 /usr/sbin/qshell
        qshell account xIbruH0wyRKRbCk2rDdRq7TgRetaXEbyKNWQuVbA 6lAilWtW5lTpV-N-0ftK6riHOn2qqOncT8TVnARY
fi
alias qshell_list="qshell listbucket docment qshell_list.txt&&sed 's/^/http:\/\/o6zvblq1c.bkt.clouddn.com\//' qshell_list.txt"
alias qshell_put="qshell fput docment"
alias qshell_del="qshell delete docment"
alias qshell_get='function __zhouchun() { echo "http://o6zvblq1c.bkt.clouddn.com/$*";wget "http://o6zvblq1c.bkt.clouddn.com/$*"; unset -f __zhouchun; }; __zhouchun'

