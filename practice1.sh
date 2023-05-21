#!/bin/bash

#get one number and compare it with 10 return result lower bigger or equal

while [ -z $NUM1 ]
do
        read -p "  enter a number to compare it with 10:  " NUM1
done

NUM1=`echo $NUM1 | tr -d [:blank:] | tr -d [:punct:]`

#echo $NUM1

if [ $NUM1 -gt 10 ]
then
        echo " your entered number is greater than 10 :) "
elif [ $NUM1 -eq 10 ]
then
        echo " your entered number is equal to 10 := "
else
        echo " your entered number is less than 10 :( "
fi

