#!/bin/bash

function display_help() {
  cat <<EOF
        mode dark
        mode work // 2 screens expandido
        mode chill // 1 screens
        mode pitch // 2 screens expandido (apresentação)
        mode demo // 2 screens mirror

        mode -h, --help

        //TODO
        remover notificações em modo pitch era capaz de ser bem jogadosage:
EOF
}

function change_theme_to() {
  echo "Theme changed to $1!"
}

function change_screen_to() {
  case $1 in
  work)
    xrandr --output HDMI1 --auto --right-of eDP1
    ;;
  chill)
    xrandr --output HDMI1 --off
    ;;
  pitch)
    xrandr --output HDMI1 --auto --right-of eDP1
    ;;
  demo)
    xrandr --output HDMI1 --auto --same-as eDP1
    ;;
  esac

  echo "Changed to mode $1!"
  i3-msg restart
}

case $1 in
-h | --help)
  display_help
  ;;
dark | light)
  change_theme_to "$1"
  ;;
work | chill | pitch | demo)
  change_screen_to "$1"
  ;;
*)
  display_help >&2
  exit 1
  ;;
esac
