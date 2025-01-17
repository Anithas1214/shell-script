#!/bin/bash

userid=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
script_name=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$script_name-$timestamp.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
validate(){
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

echo "all packages: $@"

for i in $@
do
 echo "package to install: $i"
 dnf list installed $i &>>$logfile
 if [ $? -eq 0 ]
 then
    echo -e "$i already installed.....$Y skipping $N"
 else
      dnf install $i -y &>>$logfile
      validate $? "installation of $i"
 fi     
done 