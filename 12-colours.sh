#!/bin/bash
userid=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
script_name=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$script_name-$timestamp.log
echo "script started executing at: $timestamp"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
validate(){
  echo " exit status: $1"
  echo " what are you doing: $2"
}
validate1(){
   if [ $1 -ne 0 ]
   then
      echo -e "$2......$R failure $N"
      exit 1
   else
     echo -e "$2......$G success $N"
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

dnf install something -y &>>$logfile
validate1 $? "something wrong"