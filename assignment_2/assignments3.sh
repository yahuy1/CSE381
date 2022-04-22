#!/bin/bash

# A function to build the structure
function buildStructure()
{
    echo "Building the structure"

    mkdir root
    cd root
    mkdir users
    mkdir files
    mkdir bin
    mkdir lib
    
}

# A function to create five directories for five users in the Users directory
function createUserDirectories()
{
    echo "Creating user directories"

    # User directories are named as User1, User2, User3, User4, User5

    cd users

    for (( i = 1; i <= 5; i++ ))
    do
        mkdir User$i
    done
    
}

# A function to create 20 files in the Files directory
function createFileDirectories()
{
    echo "Creating files ....."

    # Files must be of types txt, jpg, gz, iso, log, exe only
    # The text files MUST NOT be empty (i.e. they must contain some randome texts)
    # The file types MUST be passed as an argument to this function
    # To generate a random number, use the command $RANDOM
    # To generate a random number between two numbers, use the command $(( RANDOM % (max - min) + min ))

    cd ../files

    local types=("$@")
    for (( i = 1; i <= 20; i++ ))
    do
        local index=$(($RANDOM % 6))
        touch file$i.${types[index]}
        echo "some random texts" > file$i.${types[index]}
    done

}

# A function to send messages to the users
function sendMessage()
{
    echo "Sending messages to users"

    # A message indicating the sending of special files to special users displayed in the terminal windows of those users
    
    # The txt files in the Files directory are sent to user1 in the Users directory
    find . -type f -name "*.txt" -exec mv {} ../users/User1 \;
    # The jpg files in the Files directory are sent to user2 in the Users directory
    find . -type f -name "*.jpg" -exec mv {} ../users/User2 \;
    # The gz files in the Files directory are sent to user3 in the Users directory
    find . -type f -name "*.gz" -exec mv {} ../users/User3 \;
    # The iso files in the Files directory are sent to user4 in the Users directory
    find . -type f -name "*.iso" -exec mv {} ../users/User4 \;
    # The log files in the Files directory are sent to user5 in the Users directory
    find . -type f -name "*.log" -exec mv {} ../users/User5 \;

    
}

# A function to clean up all the exe files in the Files directory
function cleanUp()
{
    echo "Cleaning up files"
    find . -type f -name "*.exe" -delete
}


# A function to display the contents of the structure 
function displayStructure()
{
    echo "Displaying the structure"
    cd ..
    tree
}


# --------------------------- Main Program ---------------------------- #

# First, you MUST use the Miami University Linux server to run this script


# Open five different terminal windows (Do this using the ssh command five times)


# Display pts of the terminal windows so that you can know which terminal window is associated with which user


# Call the functions in the order that they are written in the script above

declare -a fileTypes
fileTypes=("txt" "jpg" "gz" "iso" "log" "exe")

buildStructure
createUserDirectories
createFileDirectories "${fileTypes[@]}"
sendMessage
cleanUp
displayStructure