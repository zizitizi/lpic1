
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

cat .gitconfig
git config --global core.editor vim

 git config --global core.pager "less"

##system level config 
git config --system system.name "git repo1"
git config --system user.name “user1 user”
git config --global system.name “My Git Repo Server 1”  - system name for that user in global level
git config --global core.editor vim
git config --global core.pager ‘less’
git config --list == cat /etc/gitconfig
cat ~/.gitconfig




## git repo

make directory for source code. and introduce it to git. after that git track that directory

with git user make directory
ls -l
mkdir gittest1
ls -l 
cd gittest1/
git init
ls -la
if we have hidden fiel .git in dir list . it shows this forlder tracked by git
cd .git
ls -l
cat config  - its our local configuration file

if rm -rf .git -- this folder not track by git

git status - after every change run this command


## file status in git 
we have 3 status for fiel in git:
1- untracked (unstaged)  - something like  actor waiting to role play on stage in teather. to unstaged files use
git rm --cached file1  -
2- staged  - staged file with command  -something like  role playig actor on stage in teather
git add 
3- commit  - commit and register your change with command  - editor in theater - reports of editor is like commit message. goes that file to new version final register. released version
git commit  - open default editor. its wats new file.


vi scrip1.txt
git status
git add scrip1.txt  - add this file to stage
git add -A == git add *  -  add all file in directory to staged
git log

f94a8a2bddfc26eeb055297acd53eecf885c9c8a  - its commit id - unique in the world

ls -la
vi scrip1.txt- change file
git status - need to commit that modifed file . to restore to previous version
git restore scrip1.txt - restore to before commit
vi script1.txt
git status
vi newfile1.txt
 git add -A
git status

 git commit -m " new file 1 added and scrip1.txt modified"

 git status

 git log
 
 highest commit is newer one.
 
 commit id - 7  begin digit is refrence id

git diff HEAD - detect diff between last commit and before

git log
 
git diff f94a8a2b 14a1bf26 - difference between this 2 commit - be care full first older commit refrence id than newer commit

git diff <older commit id> <newer commit id>  - 
 
 
 
 ### git important commands in brief:
 
 git init
 git status
 git add -A
 git commit -m ""
 git rm --staged <file>  - cached
 git log
 <><><><><><><><><><><
 git restore <file>
 git revert
 git reset
 <><><><><><><><><><><
 git diff commit1 commit2
      
 
 
 ## git reset vs revert vs restore
      
      git restore -- have not new commit
      git revert -- new commit for undo will register - doesnt update branch
      git reset -- dangreous - it clear all by changing index bring to top  - branch update
      
 
## clone vs cp
      
      in cp there is not any relation between cp and cp
  but in clone relation ship is exist. for ex. after cjange we con push and merge it to server .
      
      to run pull need new commit id.
      
      git push can not do without permission: git push is disabled by default. but we cna change it by this commands:
      
      git config --global recieve.denyCurrentBranch ignore  --or something else true ,.. -id ignore we can push changes- run this commad on cloned server - for disable write false
      
      git config --list
      
      
## git tag
      
      have 2 type: annotation or non-annotation
      
      commonly after every sprint or after multiple commit that complete one feather or solve important bug ,.... we use tag to release a version (maybe minor or major) . this commit is release and commonly stand for production server or be live for customer that we called released candidate or rc. it get tag or version number.
      stagging - production stable.  dev stg uat prod  - stage in common company
      
      git tag tag1  - non-annotation
      
      git tag -a V1.1 -m "version 1.1 released"
      
      git tag == git tag --list
      
      git tag v1.2 cimmitid
      
      gti tag v1.3 --delete
      
      git show v1.1
      
## git branch
      
      


   
  Git branch Commands:
 
  Git branch -a  -  List all of your branches.

  Git branch [name]    -  Creating a new branch at the current commit.

  Git checkout [branch-name]  - Switch to another branch.

  Git checkout -b [name]  - Create a new branch and switch to it at the moment.

  Git merge [branch]  - Unstage a file while retaining the changes in working directory.
      
  Git merge [branch] --no-ff -   Create a merge commit in all cases. No fast-forward.

  Git log  - Show all commits in the current branch’s history.

hint: to do git merge we should be on destination than run : git merge develop
      
      git log -5  - 5 last log
      
      
      
git log
git log -p -2
git log --stat
git log --pretty=oneline
git log --pretty=oneline --graph
git log --pretty=reference
git log --graph
      
********sample for beatify git log code:
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit


      
note1: in crontan to have and see log do:
      0 0 * * * tar -zcvf /tmp/ubuntu_home.tar.gz /home/zizi/gittest2 >> /home/zizi/cronzizi.log 2>&1

note: when we have confilict on brach merge git. what can we do? 
      we have confilict when 2 brach work on a same file and on same line. to fix confilict in server git open file manually and edit it and add and commit . on github select which one we considered.
  
  
  
# github
  
git with web gui.  have ci/cd. nowdays we dont need jenkins. 
  
pull reguest from github is like push from us.
  
mr==gr  merege request  
wiki==readme
  
default branch in github and gitlab is main we can change it to master by setting
  
  
to clone from github:
  git clone <giturl>

  
github action == devops pipeline == CI/CD
  
github is origin and my clone name is remote

after add and commit we can push it again to github  
  
to push into github account , will be asking from github user account and password. to provide password we should go in github to profile setting (not project setting) > developer mode > personal access tokens > tokens (classic) > generate new token> generate new token(classic)
after provide note and expiration date and generate it . copy and keep it in your pc . copy and paste this token in answer of : your password
all thing will be push and sync  

  
  
# git lab
  
git with gui that we can install locally. have ci/cd. nowdays we dont need jenkins. 
gitlab-ci  -  we can deploy both win and linux but linux is better integrate
  
  
  
# Azure
  
azure cloud -aws -gcp : all is cloud
but microsft have microsoft azure devops that we can install locally - include: git repo (code commit) -ci/cd- docker
Azure -  we can deploy both win and linux but windows is better integrate  
  
  
  
 






