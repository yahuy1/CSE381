#!/bin/bash

# Display the pattern options to the user
echo "To plot right-top triangle, press R"
echo "To plot diagonal, press D"
echo "To plot secondary diagonal, press S"
echo "To plot Hollow square, press H"
echo "To exit, press Q"
echo "-----------------------------------"

# Make the right_top.sh executable
chmod +x right_top.sh

# Make the diagonal.sh executable
chmod +x diagonal.sh

# Make the secondary_diagonal.sh executable
chmod +x secondary_diagonal.sh

# Make the hollow_square.sh executable
chmod +x hollow_square.sh

echo -n "Enter your option to plot pattern: "
read option

# Check valid option
while [[ "$option" != "R" && "$option" != "D" && "$option" != "S" && "$option" != "H" && "$option" != "Q" ]] ;
do 
    echo -e "Unknown option entered ... !\n"
    echo -n "Enter your option to plot pattern: "
    read option
done

if [[ "$option" == "Q" ]]
then 
    exit
fi

echo -n "Enter a symbol to be used to plot your pattern: "
read symbol

# Check valid symbol
while [[ ${#symbol} -ne 1 ]]
do
    echo -e "Invalid symbol entered ... !\n"
    echo -n "Enter a symbol to be used to plot your pattern: "
    read symbol
done

echo -n "Enter your pattern size: "
read size

# Check valid size
while [[ $size -lt 0 ]] 
do 
    echo -e "Invalid patern size ... !\n"
    echo -n "Enter your pattern size: "
    read size
done


# Loop to run as long as the option entered by the user 
while true
do
    # Check the user options to determine which shell script needs to be invoked
    # To invoke a script, two positional parameters need to be passed that script, symbol and size, namely

    if [[ "$option" == "R" ]] 
    then
        ./right_top.sh "$symbol" $size
    elif [[ "$option" == "D" ]] 
    then
        ./diagonal.sh "$symbol" $size
    elif [[ "$option" == "S" ]] 
    then
        ./secondary_diagonal.sh "$symbol" "$size"
    elif [[ "$option" == "H" ]] 
    then
        ./hollow_square.sh "$symbol" $size
    elif [[ "$option" == "Q" ]] 
    then
        exit
    else 
        echo -e "Unknown option entered ... !\n"
    fi
    
    # Prompt new option
    echo -n "You want to plot another pattern? enter another option: "
    read option

    # Check valid option
    if [[ "$option" == "Q" ]]
    then 
        exit
    # elif [[ "$option" == "R" || "$option" == "D" || "$option" == "S" || "$option" == "H" ]]
    # then
    #     echo -n "Enter a symbol to be used to plot your pattern: "
    #     read symbol

    #     # Check valid symbol
    #     while [[ ${#symbol} -ne 1 ]]
    #     do 
    #         echo -e "Invalid symbol entered ... !\n"
    #         echo -n "Enter a symbol to be used to plot your pattern: "
    #         read symbol
    #     done

    #     echo -n "Enter your pattern size: "
    #     read size

    #     # Check valid size
    #     while [[ $size -lt 0 ]] 
    #     do 
    #         echo -e "Invalid patern size ... !\n"
    #         echo -n "Enter your pattern size: "
    #         read size
    #     done
    fi
done                                                