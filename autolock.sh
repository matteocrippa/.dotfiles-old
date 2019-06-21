#!/bin/bash
xautolock -time 1 -locker "i3lock-fancy -p -- scrot -z" &
xautolock -time 2 -locker "systemctl suspend" &
