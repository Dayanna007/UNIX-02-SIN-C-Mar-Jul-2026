#!/bin/bash

# File name used to stop the loop
# Creates a variable that stores the name of the file used to stop the loop.
SIGNAL_TO_STOP_FILE="stoploop"

# Continues looping while the file does NOT exist.
# The -f test checks whether the file exists.
# The ! operator negates the test result.
# Loop while the file does not exist
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do

    # Displays a message indicating that the file has not been found.
    echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."

    # Informs the user that the script will check again after 2 seconds.
    echo "Checking again in 2 seconds..."

    # Pauses the script for 2 seconds before the next iteration.
    sleep 2
# Ends the while loop.
done

# Displays a message when the file is detected and the script exits.
echo "File was found! Exiting..."