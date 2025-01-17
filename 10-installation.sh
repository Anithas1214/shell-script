#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
   echo " run this script with super user"
else
   echo " you are super user "   
fi   
dnf install mysql -y