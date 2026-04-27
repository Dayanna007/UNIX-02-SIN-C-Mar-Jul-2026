IA porque no la utilizamos es por que nos marea haciendo demaciados comandos 
openclaw cuando alguien tiene algun inconveniente podemos acceder a Issues y te resuelven en un pull requests

touch archivo1      #file creation
mkdir directorio1   #directory creation
ls -l               #verification
sudo apt-get update         #package update
sudo apt-get upgrade        #package update
sudo apt-get install acl    #acl installation
sudo chown -R $(whoami) .   #package update
sudo setfacl -bnR .         #ACL removal
umask 007                   #Restrictive permissions (owner and group only)
touch secreto.txt           #file creation
mkdir privado               #directory creation
ls -l                       #permission check
sudo useradd -m -s /usr/bin/zsh luna  #Create user luna with home directory and Zsh shell using sudo
ls /home                              #List directories inside /home folder
ls -l mi archivo                      #Show detailed information (permissions, owner, size, etc.) for mi_archivo
sudo chown luna mi archivo            #Change owner of mi_archivo to user luna using sudo
ls -l mi_archivo                      #Show detailed file information for mi_archivo after ownership change