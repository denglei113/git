#!/bin/bash
for i in {190..198}
do
  rsync  -aXSH  --delete  /root/*   192.168.1.$i:/root/
done
