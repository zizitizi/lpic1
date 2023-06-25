# bash practice

1- get 10 number and compare to 10 output results

#!/bin/bash

#get 10 number and compare to 10 output results

while [ -z $NUM ]
do
        read -p " enter a number to compare it with 10: " NUM
done
NUM=`echo $NUM | tr -d [:alpha:] | tr -d [:blank:] | tr -d [:punct:]`
if [ $NUM -gt 10 ]
then
        echo " your enterd number is greater than 10 :)"
elif [ $NUM -eq 10 ]
then
        echo " your entered number is equal to 10 :="
else
        echo " your entered number is less than 10 :("
fi



2- get 20 number and output max , min , avg

#!/bin/bash

#get 20 number and output max , min , avg
#VAR$i get var like list

for ((i=1;i<=20;i++))
do
        read -p " please enter your $i number:" VAR
        if [ $i -eq 1 ]
        then
            MAX=$VAR
            MIN=$VAR
            SUM=$VAR
        fi
        if [ $i -gt 1 ]
        then
            SUM=$(expr $SUM + $VAR )
            if [ $VAR -gt $MAX ]
            then
                 MAX=$VAR
            elif [ $VAR -lt $MIN ]
            then
                 MIN=$VAR
            fi
         fi
 done
AVG=`echo "scale=2;${SUM}/20" | bc`
echo "maximum of your entered number is : $MAX"
echo "minimum of your entered number is : $MIN"
echo "average of your entered number is : $AVG"


3- get ip and user , pass, source path to file and destination path in front of script and copy file to dest path


#/bin/bash
#get ip and user , pass, source path to file and destination path in front of script and copy file to dest path


echo "your ip is: $1"
echo "your user is : $2"
echo "your pass is : $3"
echo "your path to source file is :$4"
echo "your destination folder is :$5"
ping -c 5 $1 > /dev/null
if [ $? -eq 0 ]
then
        echo " destination server with ip $1 and user $2 is reachable"
        sshpass -p "$3" scp -r $4 $2@$1:$5
        if [ $? -eq 0 ]
                echo "`date +%Y/%m/%d-%H:%M:%S` : file $4 has benn sucessfully copied to $2@$1:$5">> output.log
else
        echo "server $1 with user $2 is not accessible"
fi

#### HINT: we can write crontab with above script to copied like this:
crontab -e
0 0 * * * rm -rf /tmp/ubnutu_home.tar.gz; tar  -zcvf /tmp/ubuntu_home.tar.gz /home/ubuntu
10 0 * * * /home/ubuntu/myscripts/myscript2.sh 172.10.10.10 ubuntu ubuntipass /tmp/ubuntu_home.tar.gz /tmp



5- read field 1 ,3 passwd file and out put it to file with name same as date and save it everyday . after 2 days delete that file.

#!/bin/bash

#read field 1 ,3 passwd file and out put it to file with name same as date and save it everyday . after 2 days delete that file.

OUTPUT=/home/zizi/output_`date +%Y%m%d`.txt
awk -F ":" 'BEGIN{print "username:UID"} {print $1 ":" $3}' /etc/passwd | tee $OUTPUT
find /home/zizi/ -name "output*.txt" -type f -mtime +2 -exec rm -rf {} \;

#copy this file in cron.daily with permission +x


hint: to empty a file in bash script you can do like this:

cat /dev/null > output.log

while true is infinite loop we can exit it with exit 0  command

sleep 1 == 1 second




7- get a ip list file and read it line by line and out put the result in output.log line by line


#!/bin/bash

#get a ip list file and read it line by line and out put the result in output.log line by line

FILENAME=/home/ubuntu/ip-list.txt
OUTPUT=/home/ubuntu/log_${HOSTNAME}_${TODAY}.log

TODAY=`date +%Y%m%d`
DATE=`date +%Y/%m/%d-%H:%M:%S`

cat /dev/null > $OUTPUT
cat $FILENAME | while read LINE
do
        ping -c 1 $LINE > /dev/hull
        if [ $? -eq 0 ]
        then
                echo "$DATE : $LINE is pinable " | tee -a $OUTPUT
        else
                echo "$DATE : server $LINE is not pinable . please check it now!." | tee -a $OUTPUT
        fi

done


##or you can input file to read in while from end of while 






                       
