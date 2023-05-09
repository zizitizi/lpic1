
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
  
  
  
