#!/bin/sh

# find script dir incase being run outside install folder
dest="/usr/lib/systemd/system/"
files=( low_battery.timer low_battery.service low_battery.d )
script_dir=$(dirname -- "$readlink -f -- "$BASH_SOURCE")")
/bin/cd $script_dir

/bin/echo "copying ${files[@]} to $dest"

for file in ${files[@]}
do
	/bin/cp -r "$file" "$dest"
done
