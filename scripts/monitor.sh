#!/bin/bash

function display_help() {
  cat <<EOF
        mode dock // thinkpad dock
        mode laptop // laptop screen only

        mode -h, --help

EOF
}

function change_screen_to() {
  case $1 in
  dock)
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output DP1 --off --output DP2 --off --output DP2-1 --off --output DP2-2 --off --output DP2-3 --mode 2560x1080 --pos 0x0 --rotate normal --output     HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
    ;;
  laptop)
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output DP1 --off --output DP2 --off --output DP2-1 --off --output DP2-2 --off --output DP2-3 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
    ;;
  esac

  pkill -USR1 polybar

  echo "Changed to mode $1!"
  i3-msg restart
}

case $1 in
-h | --help)
  display_help
  ;;
dock | laptop )
  change_screen_to "$1"
  ;;
*)
  display_help >&2
  exit 1
  ;;
esac
