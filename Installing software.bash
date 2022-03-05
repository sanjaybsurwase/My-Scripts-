#!/bin/bash
vim --version 1>/dev/null 2>&1
if [[ $? -eq 0]]
then 
echo"A;ready installe"
else
yum install vim -y
fi

wget --version 1>/dev/null 2>&1
if [[ $? -eq 0]]
then 
echo"A;ready installe"
else
yum install wget -y
fi
