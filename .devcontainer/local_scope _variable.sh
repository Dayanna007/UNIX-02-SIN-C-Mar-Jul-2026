#!/bin/bash
PUBLISHER="No Starch Press"
print_name(){
    local name
    name="Black Hat Bash"
    echo "${name} by ${PUBLISHER}"
}

print_name

echo "Variable ${name} will not be printed because it is a local variable."
#cual es la diferencia entre una variable local y global y que particularidad en la invocacion de funciones en bash
#In Bash, a global variable can be accessed from anywhere in the script, including inside functions, while a local variable 
#can only be accessed within the function where it was declared using the local keyword. In the example, PUBLISHER is a global variable
#because it is available throughout the script, whereas name is a local variable and cannot be accessed outside the print_name() function. 
#Another important characteristic of Bash is that functions are invoked by simply writing their name without parentheses; parentheses are only
#used when defining the function.