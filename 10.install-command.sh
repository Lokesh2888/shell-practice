#!/bin.bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR: Please run the script using root access"
   exit 1 #give other than 0 till 127 to exit the script
else
   echo "You are running with root access"
fi

dnf list installed mysql

#check already installed or not. if installed $? is 0, then 
#If not installed $? is not 0. expression is true.
if [ $? -ne 0 ]
then
   echo "MYSQL is not installed...and it is going to INSTALL"
   dnf install mysql -y
   if [ $? -eq 0 ]
   then
      echo "Installing MYSQL is.... SUCCESS"
   else
      echo "Installing MYSQL is.... FAILURE"
      exit 1
    fi
else
   echo "MYSQL is already INSTALLED...nothing to do"
   exit 1   
fi


