#!/bin.bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR: Please run the script using root access"
fi

dnf install mysql -y
