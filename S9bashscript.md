
# connect server without password

linux user uses two key : public key (key just belong to you) and private key (lock you can copy it every where)

this method is used to connect via ssh , sftp , scp we use this method to prevent use of password and its Disadvantages.

nowdays ssh is by default open in linux distro but before is not and should be opend manually.

common method for encrypt and keygenrator is rsa. then when you navigate to .ssh folder in user home, id_rsa.pub is user public key and id_rsa is private key and always keep it secure and confidential.

ssh-keygen

use this command just one time on each server to make keys. cuase use this command again make pub and pri keys overwrite. if You had to use it then copy pub key and all stage again.

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


