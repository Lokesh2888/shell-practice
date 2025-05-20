#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
   echo -e "$R ERROR:: Please run the script using root access $N"
   exit 1 #give other than 0 till 127 to exit the script
else
   echo "You are running with root access"
fi

#validate function takes input as exit status, what command they tries to install
VALIDATE(){
     if [ $1 -eq 0 ]
   then
      echo -e "Installing $2 is.... $G SUCCESS $N"
   else
      echo -e "Installing $2 is.... $R  FAILURE $N"
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
   echo -e "$Y MYSQL is already INSTALLED...nothing to do $N" 
fi

dnf list installed python3
if [ $? -ne 0 ]
then
   echo "python3 is not installed...and it is going to INSTALL"
   dnf install python3 -y
   VALIDATE $? "python3"
else
   echo -e "$Y python3 is already INSTALLED...nothing to do $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
   echo "nginx is not installed...and it is going to INSTALL"
   dnf install nginx -y
   VALIDATE $? "nginx"
else
   echo -e "$Y nginx is already INSTALLED...nothing to do $N"
fi
