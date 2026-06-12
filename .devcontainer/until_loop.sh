#!/bin/bash
#Creates a variable named FILE and assigns the filename "output.txt".
FILE="output.txt"

# Creates the file if it does not exist.
# If it already exists, its timestamp is updated.
touch "${FILE}"

# Repeats the loop until the file has content.
# The -s test checks whether the file exists and has a size greater than zero.
until [[-s "${FILE}"]]; do

# Displays a message indicating that the file is currently empty.
 echo "${FILE} is empty..."

 # Informs the user that the script will check the file again after 2 seconds.
 echo "Checking again in 2 seconds..."

 # Pauses the script for 2 seconds before the next check.
 sleep 2

 # Ends the until loop.
done

# Displays a message once the file contains data and the loop finishes.
echo "${FILE} appears to have some content in it!"