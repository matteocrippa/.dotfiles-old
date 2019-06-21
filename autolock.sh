#!/bin/sh

# start me in your autostart, e.g. .xinitrc

[[ ! -f /usr/bin/xautolock ]] && echo "xuatolock is required" && exit 0
[[ ! -f /usr/bin/xset ]] && echo "xset is required" && exit 0

_suspender() {
    case $1 in
        bat)
            pgrep xautolock > /dev/null && pkill xautolock
            # lock after 5 minutes
            xset s on; xset s 300
            # screen off after 10 minutes
            xset dpms 0 0 600
            # suspend after 15 minutes
            xautolock -time 15 -locker "systemctl suspend" &
        ;;
        adp)
            pgrep xautolock > /dev/null && pkill xautolock
	    xset s on; xset s 600
            xset dpms 0 0 900
            xautolock -time 30 -locker "systemctl suspend" &
        ;;
    esac
}

if cat /sys/class/power_supply/AC/online | grep 0 > /dev/null 2>&1
then
    _suspender bat
else
    _suspender adp
fi
exit 0

