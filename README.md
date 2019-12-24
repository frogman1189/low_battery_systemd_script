# low_battery_systemd_script

Simple systemd script that uses acpi to check whether battery is less than 15%.
If battery is lower than 15% then it will alter the value stored in "/sys/class/backlight/intel_backlight/brightness"

To change path to brightness file update backlight_path in low_battery.d/low_battery.sh

To install run sudo ./install.sh
Then run systemctl enable low_battery.timer

To uninstall run sudo ./uninstall.sh

As always, checking the install scripts is advised, and due to laziness I didn't write a proper package nor makefile so it won't be managed by your package manager nor will dependencies be installed (acpi)
