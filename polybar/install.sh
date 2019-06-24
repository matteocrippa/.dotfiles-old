#!/bin/bash

rm battery-combined-udev.sh

if [ -d /sys/class/power_supply/AC ]; then
    echo 'Lenovo'
    cp battery-lenovo.sh battery-combined-udev.sh
else
    echo 'GPD'
    cp battery-gpd.sh battery-combined-udev.sh
fi
