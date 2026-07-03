# List files and directories
ls

# List the contents of the Documents directory
ls Documents

# Display the aptitude easter egg
aptitude moo

# List files using the long format
ls -l

# List files in reverse order
ls -r

# List files in long format and reverse order
ls -l -r

# List files using the combined long and reverse options
ls -lr

# Display the aptitude easter egg
aptitude moo

# Display the aptitude easter egg with verbose output
aptitude -v moo

# Display the aptitude easter egg with more verbose output
aptitude -vv moo

# Display the aptitude easter egg with maximum verbosity
aptitude -vvv moo

# Display the aptitude easter egg using repeated verbose flags
aptitude -v -v moo

# Show the current working directory
pwd

# Change to the Documents directory
cd Documents

# Change to the root directory
cd /

# Change to the codespace home directory
cd /home/codespace

# Change to the Documents directory
cd ~/Documents

# Display the contents of animals.txt
cat animals.txt

# Display the contents of alpha.txt
cat alpha.txt

# Show the first lines of alpha.txt
head alpha.txt

# Show the last lines of alpha.txt
tail alpha.txt

# Display the first five lines of alpha.txt
head -n 5 alpha.txt

# Display the last five lines of alpha.txt
tail -n 5 alpha.txt

# Change to the Documents directory
cd ~/Documents

# Copy the passwd file to the current directory
cp /etc/passwd .

# List files and directories
ls

# Change to the home directory
cd ~

# Create a 50 MB file filled with zeros
dd if=/dev/zero of=/tmp/swapex bs=1M count=50

# Change to the Documents directory
cd ~/Documents

# Move people.csv into the Work directory
mv people.csv Work

# List the contents of the Work directory
ls Work

# Move multiple files into the School directory
mv numbers.txt letters.txt alpha.txt School

# List the contents of the School directory
ls School

# List files and directories
ls

# Rename animals.txt to zoo.txt
mv animals.txt zoo.txt

# List files and directories
ls

# Remove the file linux.txt
rm linux.txt

# Check if linux.txt still exists
ls linux.txt

# Remove the Work directory
rm Work

# Remove the Work directory recursively
rm -r Work

# Verify if the Work directory still exists
ls Work

# Copy the passwd file to the current directory
cp /etc/passwd .

# Search for the sysadmin user in the passwd file
grep sysadmin passwd

# Search for the word root in the passwd file
grep 'root' passwd

# Search for lines that start with root
grep '^root' /etc/passwd

# Display the contents of alpha-first.txt
cat alpha-first.txt

# Search for lines ending with the letter r
grep 'r$' alpha-first.txt

# Display the contents of red.txt
cat red.txt

# Search for words matching the pattern r..f
grep 'r..f' red.txt

# Search for words matching the pattern r..d
grep 'r..d' red.txt

# Search for any sequence of four characters
grep '....' red.txt

# Search for the pattern r..t in the passwd file
grep 'r..t' /etc/passwd

# Display the contents of profile.txt
cat profile.txt

# Search for lines containing numbers
grep '[0-9]' profile.txt

# Search for lines containing non-numeric characters
grep '[^0-9]' profile.txt

# Search for lines containing a period
grep '[.]' profile.txt

# Display the contents of red.txt
cat red.txt

# Search using the re*d pattern
grep 're*d' red.txt

# Search using the r[oe]*d pattern
grep 'r[oe]*d' red.txt

# Search using the z* pattern
grep 'z*' red.txt

# Search using the e* pattern
grep 'e*' red.txt

# Search using the ee* pattern
grep 'ee*' red.txt

# Search for the word red
grep 'red'
The girl in the red dress had red hair and a matching red bow
The horse in the red saddle was bred for racing.

# Change to the home directory
cd ~

# Switch to the root user
su -

# Shut down the system immediately
shutdown now

# Display the current date and time
date

# Schedule a shutdown at 01:12
shutdown 01:12

# Schedule a shutdown in one minute with a message
shutdown +1 "Goodbye World!"

# Display network interface information
ifconfig

# Send four ping requests to 192.168.1.2
ping -c 4 192.168.1.2

# Send four ping requests to 192.168.1.3
ping -c 4 192.168.1.3

# Exit the current session
exit

# Display running processes
ps

# Display all running processes
ps -e

# Display all running processes with full details
ps -ef

# Update the package list
sudo apt-get update

# Search for packages related to cow
apt-cache search cow

# Install the cowsay package
sudo apt-get install cowsay

# Display a message using cowsay
cowsay "NDG Linux Unhatched"

# Update the package list
sudo apt-get update

# Upgrade installed packages
sudo apt-get upgrade

# Remove the cowsay package completely
sudo apt-get purge cowsay

# Change the current user's password
passwd

# Display the password status of the sysadmin user
passwd -S sysadmin

# Change the password for the sysadmin user
passwd sysadmin

# Exit the current session
exit

# Display the contents of food.txt
cat food.txt

# Copy the contents of food.txt to newfile1.txt
cat food.txt > newfile1.txt

# Display the contents of newfile1.txt
cat newfile1.txt

# Print a message to the terminal
echo "Hello"

# Display the contents of newfile1.txt
cat newfile1.txt

# Overwrite newfile1.txt with new text
echo "I like food." > newfile1.txt

# Display the updated contents of newfile1.txt
cat newfile1.txt

# Append new text to newfile1.txt
echo "This food is good." >> newfile1.txt

# Display the final contents of newfile1.txt
cat newfile1.txt

# Open newfile.txt with the Vi editor
vi newfile.txt