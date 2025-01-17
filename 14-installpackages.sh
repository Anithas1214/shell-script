#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
   echo " run this script with super user"
   exit 1
else
   echo " you are super user "   
fi 

echo "all packages: $@"