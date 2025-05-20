#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 |cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python3" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
   echo -e "$R ERROR:: Please run the script using root access $N"
   exit 1 #give other than 0 till 127 to exit the script
else
   echo "You are running with root access" | tee -a $LOG_FILE
fi

#validate function takes input as exit status, what command they tries to install
VALIDATE(){
     if [ $1 -eq 0 ]
   then
      echo -e "Installing $2 is.... $G SUCCESS $N" | tee -a $LOG_FILE
   else
      echo -e "Installing $2 is.... $R  FAILURE $N" | tee -a $LOG_FILE
      exit 1
    fi
}

#Loop to install all the packages
#for package in ${PACKAGES[@]}
for package in $@  #You can pass the arguments as script name & package name
do
  dnf installed list $package &>>$LOG_FILE
  if [ $? -ne 0 ]
then
   echo "$package is not installed...and it is going to INSTALL" | tee -a $LOG_FILE
   dnf install $package -y &>>$LOG_FILE
   VALIDATE $? "$package"
else
   echo -e "$Y $package is already INSTALLED...nothing to do $N" | tee -a $LOG_FILE
fi
done
