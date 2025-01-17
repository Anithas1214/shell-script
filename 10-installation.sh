#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
   echo " run this script with super user"
   exit 1
else
   echo " you are super user "   
fi   
dnf install mysqll -y
if [ $? -ne 0 ]
then
   echo "installtion of mysql ..........failure"
   exit 1
fi
dnf install git -y 
if [ $? -ne 0 ]
then
   echo "installtion of git ..........failure"
   exit 1
else
    echo "installtion of git ..........succeeded"     
fi   
echo "is script is proceeding?"