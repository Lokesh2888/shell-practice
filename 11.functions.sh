#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR: Please run the script using root access"
   exit 1 #give other than 0 till 127 to exit the script
else
   echo "You are running with root access"
fi

#validate function takes input as exit status, what command they tries to install
VALIDATE(){
     if [ $1 -eq 0 ]
   then
      echo "Installing $2 is.... SUCCESS"
   else
      echo "Installing $2 is.... FAILURE"
      exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
   echo "MYSQL is not installed...and it is going to INSTALL"
   dnf install mysql -y
   VALIDATE $? "MYSQL"
else
   echo "MYSQL is already INSTALLED...nothing to do" 
fi

dnf list installed python3
if [ $? -ne 0 ]
then
   echo "python3 is not installed...and it is going to INSTALL"
   dnf install python3 -y
   VALIDATE $? "python3"
else
   echo "python3 is already INSTALLED...nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
   echo "nginx is not installed...and it is going to INSTALL"
   dnf install nginx -y
   VALIDATE $? "nginx"
else
   echo "nginx is already INSTALLED...nothing to do"
fi
