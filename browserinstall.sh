#!/usr/bin/env bash
#
# Script name: browserinstall
# Description: Install various browsers in Ubuntu Linux
# Dependencies: rofi or dmenu and Ubuntu
# Contributors: RitchielRez
#

# An array of browser names. You can edit htis list to add/remove
# search engines. The format must be: [browser_executable_name]="Browser Name".
declare -a options=(
"brave-browser"
"chromium-browser"
"firefox"
"google-chrome"
"vivaldi"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p "Pick up a browser to install")


