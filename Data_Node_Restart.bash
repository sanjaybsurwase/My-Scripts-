#!/bin/bash 
echo "Finding the process id and kill it"
kill -9 `ps -ef | grep 'elasticsearch' | grep -v grep | awk '{print $2}'` & rm -rf nohup.out
echo "process terminated" 
cd /home/elasticsearch/cap-elasticsearch-1.2.1-bundle/bin/
echo "Directory changed"
echo "will wait for 10 second and remove nohup.out"
sleep 10s
rm -rf nohup.out     
echo " Removed the nohup.out will wait for 10 second"
sleep 10s 
echo "starting the service "
 nohup ./elasticsearch -Xms4g -Xmx4g &
sleep 15s
echo "============================================================================================================================================================="
echo " Service status is:-"
head -n 10 nohup.out >> /tmp/result
value=$( grep -ic "started" /tmp/result )
if [ $value -eq 1 ]
then
  echo -e "\033[0;33m Service  started \033[0m"

else
  echo -e "\033[0;31m Service not started \033[0m"
fi
echo "============================================================================================================================================================"
rm -rf /tmp/result
