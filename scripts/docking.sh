#!/bin/bash

dock_enabled() {
    exec ~/.dotfiles/scripts/monitor.sh dock
}

dock_disabled() {
    exec ~/.dotfiles/scripts/monitor.sh laptop
}

case $1 in
    enable )
        dock_enabled
    ;;
    disable )
        dock_disabled
    ;;
esac
