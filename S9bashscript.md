
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


