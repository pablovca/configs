#!/bin/bash

acpi_name=$(ls /sys/class/backlight)
#echo $acpi_name
brightness_path="/sys/class/backlight/$acpi_name/brightness"
brightness=$(cat $brightness_path)

max_brightness_path="/sys/class/backlight/$acpi_name/max_brightness"
max_brightness=$(cat $max_brightness_path)

min_brightness=5

print_current_brightness() {
    echo "current brightness: $brightness" 
}

print_maximum_brightness() {
    echo "maximum brightness: $max_brightness"
}

decrease_brightness() {
    #echo $1
 
    brightness=$((brightness - $1))
    if (( brightness > 0 ))
    then 
	echo decreasing brightness
	sudo tee $brightness_path <<< $brightness
        print_current_brightness
    else
        echo minimun brightness reached!
        sudo tee $brightness_path <<< $min_brightness
    fi
}

increase_brightness() {
    #echo $1
    brightness=$((brightness + $1))
    if (( brightness < max_brightness ))
    then
	echo incrementing brigthness
       	sudo tee $brightness_path <<< $brightness
	
	print_current_brightness 
    else
        echo maximum brightness reached!
	sudo tee $brightness_path <<< $max_brightness
    fi	
}

if [[ $1 = "--inc" ]]
then
    increase_brightness $2 
elif [[ $1 = "--dec" ]]
then
    decrease_brightness $2
else
    echo invalid option $1
fi	

