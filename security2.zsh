# Show the current primary group
id

# Show only the name of the primary group
id -gn

# Create a file and check which group it inherits
touch ~/test_grupo_heredado.txt

# Display the file details and its assigned group
ls -la ~/test_grupo_heredado.txt

# List all groups the current user belongs to
groups

# Show the current group information
id -gn
echo "Grupo actual: $(id -gn)"

# Create a file before changing groups
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt

# List all groups the current user belongs to
groups

# Search for the root group in the group configuration file
cat /etc/group | grep root

# Create another file to verify group assignment
touch ~/despues_grupos.txt

# Display the file details and its assigned group
ls -la ~/despues_grupos.txt

# Show the current working directory
pwd

# Display the name of the current user
whoami

# Show permissions and details of the /root directory
ls -ld /root

# Show permissions and details of the /workspaces directory
ls -ld /workspaces

# Show permissions and details of the course workspace directory
ls -ld /workspaces/UNIX-02-SIN-C-Mar-Jul-2026

# Display detailed information about the inherited-group file
stat ~/test_grupo_heredado.txt

# Display detailed information about the file created before group changes
stat ~/antes_de_newgrp.txt

# Display detailed information about the file created after group operations
stat ~/despues_grupos.txt

# Set file permissions to read and write for the owner only
chmod 600 ~/test_grupo_heredado.txt

# Verify the updated permissions of the file
ls -la ~/test_grupo_heredado.txt

# Set file permissions to read and write for owner, read-only for others
chmod 644 ~/antes_de_newgrp.txt

# Verify the updated permissions of the file
ls -la ~/antes_de_newgrp.txt

# Grant full permissions to all users on the file
chmod 777 ~/despues_grupos.txt

# Verify the updated permissions of the file
ls -la ~/despues_grupos.txt

# Display detailed information about the file created after group operations
stat ~/despues_grupos.txt

# Create a file while inside the new group session
touch ~/dentro_de_newgrp.txt

# Display the file details and its assigned group
ls -la ~/dentro_de_newgrp.txt

# Create a directory structure, including parent directories if needed
mkdir -p ~/proyecto_dev/src

# List all files and directories in the home directory
ls -la ~/

# Display the process ID (PID) of the current shell
echo $$

# Print the current shell PID with a descriptive message
echo "PID del shell actual: $$"

# Switch to the 'desarrolladores' group in a new shell session
newgrp desarrolladores

# Display the shell PID after entering the new group session
echo "PID dentro de newgrp: $$"

# Create a new group named 'grupo_restringido'
groupadd grupo_restringido

# Set or change the password for the group
gpasswd grupo_restringido

# Switch to the 'grupo_restringido' group
newgrp grupo_restringido

# Display the name of the current active group
echo "Grupo actual: $(id -gn)"