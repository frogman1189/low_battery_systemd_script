#!/bin/bash

backlight_path="/sys/class/backlight/intel_backlight/brightness"

function check_battery() {
	while [ 1 ]
	do
		local battery=( $(/bin/acpi | /bin/grep -o "[0-9]*") )
		local toggle=1
		local adapter="$(/bin/acpi -a | /bin/grep -o "on-line")"
		local brightness=$(< $backlight_path)
		while /bin/[ 15 -gt ${battery[1]} ] && /bin/[ -z "$adapter" ]
		do
			if /bin/[ $toggle -eq 1 ]
			then
				toggle=0
				/bin/echo $(($brightness / 4)) > $backlight_path
			else
				toggle=1
				/bin/echo $brightness > $backlight_path
			fi

			adapter=$(acpi -a | grep -o "on-line")
			battery=( $(acpi | grep -o "[0-9]*") )
			/bin/sleep 1
		done
		toggle=1
		/bin/echo $brightness > $backlight_path
	done
}

check_battery
