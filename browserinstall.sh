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

# An variable to store the browser name to install
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p "Pick up a browser to install")

whichcmd="which ${choice}"
# a variable to store the output of which command to check 
# if user selected browser is installed
isinstalled=$($whichcmd)

echo $isinstalled

if [[ $isinstalled == "i" ]]; then
	zenity --warning --text="Browser isn't installed\!" --title="!!!"
else
	if [[ $choice == "brave-browser" ]]; then
		zenity --warning --text="Brave is installing\!" --title="!!!"	
	elif [[ $choice == "chromium-browser" ]]; then
		zenity --warning --text="Chromium is installing\!" --title="!!!"	
	elif [[ $choice == "firefox" ]]; then
		zenity --warning --text="Firefox is installing\!" --title="!!!"	
	elif [[ $choice == "google-chrome" ]]; then
		zenity --warning --text="Google Chrome is installing\!" --title="!!!"	
	elif [[ $choice == "vivaldi" ]]; then
		zenity --warning --text="Vivaldi is installing\!" --title="!!!"	
	fi
fi
