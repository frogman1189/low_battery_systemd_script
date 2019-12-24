#!/bin/sh

# find script dir incase being run outside install folder
dest="/usr/lib/systemd/system/"
files=( low_battery.timer low_battery.service low_battery.d )
script_dir=$(dirname -- "$readlink -f -- "$BASH_SOURCE")")
/bin/cd $script_dir

/bin/echo "removing ${files[@]} from $dest"

for file in $files
do
	# check before each removal. There should only be 4 files (low_battery.d 
	# contains low_battery.sh), and it feels safer to have this safeguard.
	/bin/rm -rdi "$file" "$dest"
done
