#!/bin/bash
userid=$(id -u)

validate(){
  echo " exit status: $1"
  echo " what are you doing: $2"
}
validate1(){
   if [ $1 -ne 0 ]
   then
      echo "$2......failure"
      exit 1
   else
     echo "$2......success"
   fi     
}
if [ $userid -ne 0 ]
then
   echo " run this script with super user"
   exit 1
else
   echo " you are super user "   
fi   
dnf install mysqll -y

validate1 $? "installing my sql"
dnf install git -y
validate1 $? "installing git"
#################