#!/bin/bash
userid=$(id -u)

validate(){
  echo " exit status: $1"
  echo " what are you doing: $2"
}
if [ $userid -ne 0 ]
then
   echo " run this script with super user"
   exit 1
else
   echo " you are super user "   
fi   
dnf install mysqll -y

validate $? "installing my sql"
validate $? "installing my sql"
