#!/bin/bash

#$@ is symbol of all variables
echo "all variables: $@"

#$# is symbol of no of variables
echo "No of variables: $#"

#$0 is symbol of script name
echo "script name: $0"

#$PWD is current working directory
echo "current working directory: $PWD"

#$HOME is home directory of current user
echo "home directory of current user: $HOME"

#$USER which user is running this script 
echo "which user is running this script : $USER"

#$HOSTNAME server name
echo "server name : $HOSTNAME"

#$$ process id of shellscript
echo "process id of shellscript : $$"
sleep 60 &

#$! process id of last background command
echo "process id of last background command : $!"