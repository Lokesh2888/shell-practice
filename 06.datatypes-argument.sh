#!/bin/bash

Number1=$1
Number2=$2

Timestamp=$(date)
echo "Script executed time $Timestamp"

SUM=$(($Number1+$Number2))

echo  "the sum of Number1 & Number2 =$SUM"