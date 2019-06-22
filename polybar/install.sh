#!/bin/bash

rm ./battery-combined-udev.sh

if [ -f /sys/class/power_supply/AC]; then
    mv ./battery-lenovo.sh ./battery-combined-udev.sh
else
    mv ./battery-gpd.sh ./battery-combined-udev.sh
fi
