
# git
a  source code managment system
distributed version controling system
today we use .
git-scm.com
Organized config and many version and keep software system. git is cli in linux and made by linus troval. but today we have gui like: github and gitlab to use simply and graphical git.

git --version
apt install git

first we have mandatory config to use git . user name and email. to config then use:

git config

git config have 3 type:

1- local config : project folder /.git/config  - cat .gitconfig  - per project

2- global config : ~/.gitconfig - git config --list   - per user all project of curent user

3- system level config: in /etc/gitconfig---> entire server user config




sample: make a git user and email. and make it sudoer and config it:

useradd -m -c "user user" -s /bin/bash user1
passwd user1
sudo usermod -aG sudo user1

swirtch to that user

su - user1

id

git config --global user.name "user user"

git config --global user.email "user1@gmail.com"
 
ls -la  - see .gitconfig 











