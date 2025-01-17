#!/bin/bash

userid=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
script_name=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$script_name-$timestamp.log

validate(){
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

echo "all packages: $@"

for i in $@
do
 echo "package to install: $i"
 dnf list installed $i &>>$logfile
 if [ $? -eq 0 ]
 then
    echo "$i already installed.....skipping"
 else
      echo "$i not installed.....need to install" 
 fi     
done 