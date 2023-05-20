
# connect server without password

linux user uses two key : public key (key just belong to you) and private key (lock you can copy it every where)

this method is used to connect via ssh , sftp , scp we use this method to prevent use of password and its Disadvantages.

nowdays ssh is by default open in linux distro but before is not and should be opend manually.

common method for encrypt and keygenrator is rsa. then when you navigate to .ssh folder in user home, id_rsa.pub is user public key and id_rsa is private key and always keep it secure and confidential.

ssh-keygen

use this command just one time on each server to make keys. cuase use this command again make pub and pri keys overwrite. if You had to use it then copy pub key and all stage again. to check if key gen command run go to .ssh folder and rsa keys.

cd ~/.ssh

ls -l


known_hosts is file to keep information about fingerprints at first time connection.


you can sned your public key manually or by command:

1- manually: copy your public key and paste it in second line of destination authorized_keys (if not exist make it manually) in destination server folder ~/.ssh (if not exist then mkdir .ssh)
in destination serevr:
~/.ssh/authorized_keys
vi authorized_keys

now you can ssh withput any password
ssh user1@server_destination

2- by command line: you can copy public key by command in destination derver:

ssh-copy-id user1@server1

for the first time it will be asked for user1 pass to connect and copy key. but after that no need to password


##### note:
ssh with root user in debian based (ubuntu) server is disabled by default. to change it you should change ssh configuration.

### SSH config

in /etc/ssh we have to config file:
  1- ssh_config : its for outband trafic. its for our server ssh configuration
  
  2- sshd_config : its for inbond trafic. its for destination server ssh configuration. its more important ******
  
  ##### common config:
  
  after change default config uncomment it. comment config is default config.
  
  before every change in etc/config file first of all cp and backup it with date on it name 
  
  listen address used to set managment ip ssh. other ip can not login with ssh
  password login disable - recomand disable to datacenter and just pubkeyauthenticate enable
  pubkey authentication on
  logingracetime 5min time to prompt for enter pass
  permitroot login - default no- dont let root to ssh login
  max session- number of ssh session- in ssh tunel for vpn maybe 1000 :)
  pubkeyauthentication yes- we recomand to change it to yes in datacenter
  passwordauthentication no- recomand
  permitemty pass no-
  
 see  /var/log/auth.log
  
  
  after change configuration do:
  systemctl restart sshd
  
  
  # shell scripting (bash scripting)
  
  define a function in linux:
  function_name()
  {
   [action1]
   [action2]
  } 
  
define variable:

VAR1="value"

echo $VAR1

unset VAR1


$1 ,$2,.... $9 . we can call them in front of our function
myfunc()
{
echo $1
echo $2
echo $3
}

myfunc "arash" "ali" "sara"


## shebang

to specify script file in first line use shebang and path to compiler for ex.:
#! /bin/bash

or

#! /bin/python3


all program or excutable file detemine with it first line that for bash script file use .sh soffix. for ex.:

vi script1.sh
#! /bin/bash

echo "hello script"


note : in linux file default permission have not excute permission. then we should grant excute permission to script file:
chmod +x script1.sh

for excuting bash script file path to it. for current directory use:
./script1.sh
 but its recoomand to use complete path to it. if an excutable file is be in /bin than we just excute it without path. fro ex.: script1.sh
 
 another sample: 
 
 
#!/bin/bash

#helo description

MYNAME="zizi tizi"

echo "my name is ${MYNAME}"

 
 
note: when we use 2 variable in one line in script for out put use ${}.

OUTPUT="~/output_${USER}_${HOSTNAME}.log"

another sample:

#!/bin/bash

#date

DATE1=`date +%Y%m%d`
echo "today is ${DATE1}"

##### impotant note: for using command in variable using single quote or double quote make command simple string. for using command result in variable use: back tick ` (near number 1 in main keyboard) or $().


### at a glance

${}  ---> variable
$()  ---> result of commands
` `  ---> result of commands
$[] ----> performing math integer - used with defined variable - MM=$[5+10] , echo $MM
expr ----> performing math integer - can be calculate by itself - expr 5 + 10  - with space calculate without space a string variable Considered. also for use multiply do \*  .
bc ---> performing math float - bash calculator






 
### expr , $[]   --- integer
  
  Operator

  
  expr ARG1 + ARG2

  
  expr ARG1 - ARG2


  expr ARG1 * ARG2

  expr ARG1 / ARG2


  
  expr ARG1 % ARG2
 
  
  expr ARG1 < ARG2


  expr ARG1 <= ARG2


  
  expr ARG1 = ARG2

  
  expr ARG1 != ARG2

  
  expr ARG1 >= ARG2

  expr ARG1 > ARG2

another sample5:

#!/bin/bash

#sample of 2 number input and multiply and divide integer

read -p " enter first number :" VAR1
read -p " enter second number: " VAR2

MULTI=`expr $VAR1 \* $VAR2`

DIVIDE=$[$VAR1/$VAR2]

echo " your choosen number multiply is ${MULTI} and divided is $DIVIDE "


another sample:

#!/bin/bash

#sample date command tee

MYDATE=$(date +%Y%d%m)

OUTPUT=~/output2_`hostname`__`date +%Y%m%d`.txt

echo "today is ${MYDATE}" | tee -a  ${OUTPUT}

echo "heloo 2 lien" | tee -a ${OUTPUT}


NOTE: OUTPUT should not have double qoute "".



  
 ### bc - bash calculator - for float
 
 bc  - active calculator to get commands. for divide / that its without desimal digit. for get desimal digit use scale command for specify The number of decimal places.
 
 for ex.:
 scale = 2
 3.2/2.5
 --> 1.28
 
 
 echo "3*5" | bc
 
 with ; we can write 2 line in one line.
 
 echo "scale=5; 2.55555/3.22333" |bc
 
 sample for bash calculator:
 
 #!/bin/bash

#bc calculator

read -p " enter forst num. : " VAR1
read -p " enter second num. : " VAR2

MULTI=`echo "$VAR1*$VAR2" |bc`
DIVI=`echo "scale=4; $VAR1/$VAR2" | bc`
echo " multi is $MULTI , divide id $DIVI "

#### EOF end of file

wc << EOF   --- always come at the end of command

cat << EOF

cat >> mynames.txt << EOF


### conditioning

if [ experssion1 ]    --or -- if [];then - in one line. if true -or - if date ,... for always true
then
  command 1
  commamd 2
elif [ experssion2 ]
then
  command 3
  command 4
else
  command 5
  command 6
fi


sample1:
#! /bin/bash

#sample for if and for

read -p "enter your favorite OS: " MY_OS

if [ ${MY_OS} = "linux" ] || [ ${MY_OS} = "Linux" ] || [ $MY_OS = "unix" ]
then
    echo " nice to see you. enjoy it..."
else
    echo " shame on you...."
fi


another sample with tr:

#!/bin/bash

#### note: use
echo linux5 | tr -d '[:digit:]'

#sample code with if and tr


read -p "   enter your favorite os:   " MYOS

MYOS=`echo $MYOS | tr [:upper:] [:lower:] | tr -d [:blank:] | tr -d [:punct:] | tr -d [:digit:]`

if [ $MYOS = "linux" ] || [ $MYOS = "unix" ]
then
        echo " good"
else
       echo " bad "
fi



another sample :
#!/bin/bash

#compare two number to devide

read -p " enter number: " VAR1

read -p "  enter a number again : " VAR2

MULTI=`echo "$VAR1*$VAR2" | bc`
if [ $VAR1 > $VAR2 ]   #if there is digit in one of condition side we should use -gt inplace of >    .
then
        DIV=`echo "scale=4 ; $VAR1/$VAR2" | bc`
else
        DIV=`echo "scale=4; $VAR2/$VAR1 " |bc`
fi

echo " your multi ply is $MULTI and devide is $DIV"






 
 ### conditioning Expression

  
  STRING1 = STRING2

  
  STRING1 != STRING2
  
  -n STRING1    -- not zero string
  
  -z STRING1    --- zero string
  
  INT1 -eq INT2   -equal
  
  INT1 -ne INT2   -- not equal
 
  INT1 -ge INT2   ---- qreater equal than
  
  INT1 -gt INT2     ----= greater than
  
  INT1 -le INT2   ----- less equal than
  
  INT1 -lt INT2  ------- less than  
  
  File1 -nt File2  ----- file comparision newer than

  File1 -ot File2   -----  file comparision older than



### bash builtin variable
 
  
  $?  - common use******* - status of last command - if 0 = seuccesful - if !0 =failed

  $0   - name of script

  $1 ~ 9  - number to give var for script for ex.:
  #!/bin/bash


echo "first var is $1"
echo "first var is $2"
echo "first var is $3"
echo "first var is $4"
echo "script name is $0"
echo " all args are $@"

----->  ./scrip9bbuiltin.sh var1 var2 var3 var4
result:
first var is var1
first var is var2
first var is var3
first var is var4
script name is ./scrip9bbuiltin.sh
all args are var1 var2 var3 var4

  $@   - return all argument

  $#   - return number of args

  $$   - reyurn parent PID (script)  -- uses when reach max cpu usage  then kill PID
 
  $!   - return last child command PID

  $RANDOM    - generate random number.
  
  
  
Practice: write program to give an ip and ping it :

#!/bin/bash

#common ping script

read -p "   enter your IP :  " MYIP

OUTPUT=~/outputping9_IP_`date +%Y%m%d`.log
ping -c 5 $MYIP >/dev/null

if [ $? -eq 0 ]
then
        echo " `date +%Y/%m/%d-%H:%M:%S` -------> server ${MYIP} is reachable" | tee -a $OUTPUT
else
        echo " `date +%Y/%m/%d-%H:%M:%S` -------> server ${MYIP} is not reachable" | tee -a $OUTPUT
fi



### cut

cut file vertically
-c in number of caracter
cut -d":" -f 1,2,3 /etc/passwd   - cut delimiter : show field 1,2,3

bestpractice is to use tab instead of space in column file and default delimiter is tab and no need to write it
but in many org uses |
cat mynames.txt | cut -f 2,4

ping -c 4 8.8.8.8 | grep rtt | cut -d "/" -f 5


## awk

is a programming language. has 3 section :
BEGIN{}  - like header
{MAIN} - apply to all line
END{}   - like footer. for ex. : sum of columns

ping -c 4 8.8.8.8 | grep rtt | awk -F"/" '{print $5}'

ping -c 4 8.8.8.8 | grep rtt | awk -F"/" '{print $2 " = " $5}'

'{print $2 "\t" $5}'   - puts a tab between them
'{print $2 "\n" $5}'  - add new line (enter)  between - 
'{print $2 "\t\t" $5}'   - 2 tab
'{print $2 "\t -----> \t" $5}' 
awk BEGIN{print "hello"} {print $2 "--->\t" $5} END{"endof line" sum$4}
  
  
## loops - for  - while

for VAR in LIST;
do
  command1
  command2 ..
done


LIST can be something like:
1 2 3 4 5
{1..5}
{2..60..5}  - seq is 5
${seq 0 2 10}  - seq is 2 
${seq $start 2 $end}  - get var
  

#!/bin/bash

#simple for


for i in {1..5}
do
        echo "welcome $i "
done






#/bin/bash
#for seq=2

for i in $(seq 1 2 10)
do
   echo "num is $i"
done


## while

while [condition]
do
   command1 ..
done   

Infinite loop
while true -- or -- while [ true ]  --or-- while [ somecommandtrue ] 
do 
  command1 
done


sample code:

#!/bin/bash

#while


while [ -z $MYOS ]
do
        read -p  "  enter your os: " MYOS
done


echo "$MYOS"
#MYOS=`echo $MYOS | tr -d [:punct:] | tr -d [:blank:]`

MYOS=`echo $MYOS | tr -d [:punct:] | tr -d [:blank:]`

#if [ $MYOS="linux" ] | [ $MYOS="linux5" ]
echo "$MYOS"


if [ $MYOS = "linux" ]
then
        echo " happy you"
elif [ $MYOS = "unix" ]
then
        echo "not bad"
else
        echo "bad"
fi




# Automation (schedule jobs)






practice 1 :





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




practice 2 :


#!/bin/bash


#get 20 number compare them and outputed max , min , avg

read -p " enter your first number " M0


SUM1=$M0
MIN1=$M0
MAX1=$M0

for i in {2..6}
do
        read -p " enter your $i st. number " M1
        #NUM[$i]=M1
        SUM1=$(expr ${SUM1} + ${M1})
        #echo "$M1 , $MAX1 , $MIN1 , $SUM1"

        if [ $M1 -ge $MAX1 ]
        then
                echo "$MAX1 "
                MAX1=$M1
                echo "$MAX1 "

        elif [ $M1 -le $MIN1 ]
        then
                MIN1=$M1
        else
                i=$[$i+1]
        fi
done
AVG=`echo "scale=2;${SUM1}/6" | bc`
echo " maximum of your entered nmber is : $MAX1"
echo " minimum of your entered nmber is : $MIN1"
echo " average of your entered nmber is : $AVG"



practice 3:


 #/bin/bash


#get ip user/pass front of script name then show result of ping if pingable then scp /etc/passwd in home remote user.


echo "your ip is : $1 "

echo "your user is : $2 "

echo "your pass is : $3 "



ping -c 5 $1
#>/dev/null


if [ $? -eq 0 ]
then
        echo " destination server with ip $1 and user $2 is reachable"
        #`scp -r -B zizi /etc/passwd zizi@192.168.44.142:/home/zizi`
        #`sshpass -p "zizi" scp -r /etc/passwd zizi@192.168.44.142:/home/zizi`
        `sshpass -p "$3" scp -r /etc/passwd ${2}@192.168.44.142:/home/${2}`

else
        echo " server $1 with user $2 is not accible"
fi


practice 4:


#!/bin/bash

#5 to 50 interval5


for i in $(seq 5 5 50)
do
        echo "$i"
done










