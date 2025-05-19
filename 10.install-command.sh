#!/bin.bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR: Please run the script using root access"
   exit 1 #give other than 0 till 127 to exit the script
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
   echo "Installing MYSQL is.... SUCCESS"
else
   echo "Installing MYSQL is.... FAILURE
fi
