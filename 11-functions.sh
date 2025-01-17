#!/bin/bash
userid=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
script_name=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$script_name-$timestamp.log
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
dnf install mysql -y &>>$logfile

validate1 $? "installing my sql"
dnf install git -y &>>$logfile
validate1 $? "installing git"