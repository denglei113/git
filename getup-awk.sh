#!/bin/bash
A=$(awk -F:  '/bash$/{print $1}' /etc/passwd)        ## 提取符合条件的账号记录
for i in $A
do
        grep $i /etc/shadow | awk -F: '{print $1,"-->",$2}'                
done
