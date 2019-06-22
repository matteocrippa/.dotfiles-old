#!/bin/bash

rm battery-combined-udev.sh

if [ -f /sys/class/power_supply/AC ]; then
    cp battery-lenovo.sh battery-combined-udev.sh
else
    cp battery-gpd.sh battery-combined-udev.sh
fi
