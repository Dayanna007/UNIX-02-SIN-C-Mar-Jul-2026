#displays a list of information about files.
ls
#is incorrect and will generate an error message, but ls is correct and will execute normally.
LS
#It is a list of the files included in the directory
ls Documents
#It is a package management function available in some versions of Linux. This command accepts moo as an argument
aptitude moo
#provide more information about each of the listed files
ls -l
#It is used to list the files and folders in the current directory, displaying the results in reverse order to the usual order.
ls -r
#Displays the files and folders in the current directory in detailed format, ordering the list in reverse order to the usual order.
ls -l -r
#Displays the files and folders in the current directory in detailed format, ordering the list in reverse order to the usual order.
ls -rl
#It executes a hidden Aptitude function that displays a humorous message in the terminal as part of a program easter egg.
aptitude moo
#It executes a variant of the Aptitude easter egg that displays a humorous message in the terminal with an additional level of detail compared to the basic command.
aptitude -v moo
#It activates a more advanced version of the Aptitude easter egg, displaying a different and more elaborate humorous message in the terminal.
aptitude -vv moo
#It shows the absolute path of the directory where the current terminal session is located.
pwd
#Change the current terminal location to the Documents directory within the folder you are in.
cd Documents
#Change the current terminal location to the root directory of the file system.
cd /
#Change the current terminal location to the sysadmin user's home directory.
cd /home/sysadmin
#It shows the absolute path of the directory where the current terminal session is located.
pwd
#Change the current terminal location to the Documents directory within the folder you are in.
cd Documents
#Change the current terminal location to the Art directory, located within the School folder.
cd School/Art
#It shows the absolute path of the directory where the current terminal session is located.
pwd
#Change the current terminal location to the directory immediately above the one you are in.
cd ..
#Changes the current terminal location to the home directory of the logged-in user.
cd ~
#displays a list of information about files.
ls
#It displays in detailed format the files and folders contained within the /var/log directory.
ls -l /var/log/
#It displays in detailed format the files and folders of the /var/log directory, ordering them according to the most recent modification date.
ls -lt /var/log
#It displays in detailed format the files and folders of the /var/log directory, ordering them from largest to smallest according to their size.
ls -l -S /var/log
#It displays in detailed format the files and folders of the /var/log directory, ordering them from smallest to largest according to their size.
ls -lSr /var/log
#Displays the files and folders in the /var/log directory in reverse order to the usual order.
ls -r /var/log 
#It starts a new terminal session with another user's account — usually the superuser — fully loading their working environment.
su  -
#Close the current terminal session or terminate the running command environment.
exit
#It runs a terminal program that displays an animation of a locomotive as a humorous visual effect.
sl
#It starts a new terminal session with another user's account — usually the superuser — fully loading their working environment.
su  -
#It runs a terminal program that displays an animation of a locomotive as a humorous visual effect.
sl
#Close the current terminal session or terminate the running command environment.
exit
#Run the sl program with administrator privileges, displaying the locomotive animation in the terminal.
sudo sl
#Change the current terminal location to the Documents folder within the user's home directory.
cd ~/Documents
#It displays detailed information about the hello.sh file, such as permissions, owner, size, and modification date.
ls -l hello.sh
#Run the hello.sh file located in the current directory as a script in the terminal.
./hello.sh
#Modify the permissions of the hello.sh file to allow the owner to run it as a program.
chmod u+x hello.sh
#Run the hello.sh file located in the current directory as a script in the terminal.
./hello.sh 
#It displays the contents of the current directory in detailed format, including permissions, owner, size, and modification date of each file or folder.
ls -l
#Change the owner of the hello.sh file to the root user with administrator privileges.
sudo chown root hello.sh 
#It displays detailed information about the hello.sh file, including permissions, owner, size, and modification date.
ls -l hello.sh  
#Run the hello.sh file located in the current directory as a script in the terminal.
./hello.sh 
#Run the hello.sh script with administrator privileges, allowing the program to run with elevated system permissions.
sudo ./hello.sh  
#Change the current terminal location to the Documents folder within the user's home directory.
cd ~/Documents
#Displays the complete contents of the animals.txt file in the terminal.
cat animals.txt 
#Displays the complete contents of the alpha.txt file in the terminal.
cat alpha.txt 
#Displays the first few lines of the alpha.txt file in the terminal.
head alpha.txt
#Displays the last lines of the alpha.txt file in the terminal.
tail alpha.txt
#Displays the first 5 lines of the alpha.txt file in the terminal.
head -n 5 alpha.txt
#Displays the last 5 lines of the alpha.txt file in the terminal.
tail -n 5 alpha.txt
#Copy the system file /etc/passwd to the current directory without modifying its contents or original location.
cp /etc/passwd .
#Displays in the terminal the list of files and folders in the current directory.
ls
#Change the current terminal location to the user's home directory.
cd ~
#Create a 50 MB file called swapex in /tmp, filling it with null data generated from the input device /dev/zero.
dd if=/dev/zero of=/tmp/swapex bs=1M count=50 

listo


