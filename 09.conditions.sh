#!/bin/bash

Number=$1

if [ $Number -lt 10 ]
then
   echo "Given number $Number is less than 10"
else
   echo "Given number $Number is not less than 10"
fi