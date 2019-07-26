#!/bin/bash
xautolock -detectsleep -corners -000 -notify 120 -notifier "notify-send 'The system is going down...'" -time 10 -locker "i3lock-fancy" -killtime 10 -killer "systemctl suspend" &
