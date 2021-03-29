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

if [[ $isinstalled = "" ]]; then
	if [[ $choice == "brave-browser" ]]; then
		zenity --info --text="Brave is installing\!" --title=""	

		# output=$(sudo apt install apt-transport-https curl gnupg -y)
		# zenity --info --text="$(printf '%s' "$output")" --title=""

	elif [[ $choice == "chromium-browser" ]]; then
		zenity --info --text="Chromium is installing\!" --title=""	

		konsole -e "sudo apt install chromium-browser"

		zenity --info --text="Chromium is installed\!" --title=""	
	elif [[ $choice == "firefox" ]]; then
		zenity --info --text="Firefox is installing\!" --title=""	

		konsole -e "sudo apt install firefox"

		zenity --info --text="Firefox is installed\!" --title=""	
	elif [[ $choice == "google-chrome" ]]; then
		zenity --info --text="Google Chrome is installing\!" --title=""	
		
		konsole -e "wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads"
		output=$(sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb)
		zenity --info --text="$(printf '%s' "$output")" --title=""
		
		zenity --info --text="Google Chrome is installed\!" --title=""	
	elif [[ $choice == "vivaldi" ]]; then
		zenity --info --text="Vivaldi is installing\!" --title=""	

		konsole -e "sudo apt install chromium-browser"

		zenity --info --text="Vivaldi is installed\!" --title=""	
	fi
else
	if [[ $choice == "brave-browser" ]]; then
		zenity --info --text="Brave is installed\!" --title=""	
	elif [[ $choice == "chromium-browser" ]]; then
		zenity --info --text="Chromium is installed\!" --title=""	
	elif [[ $choice == "firefox" ]]; then
		zenity --info --text="Firefox is installed\!" --title=""	
	elif [[ $choice == "google-chrome" ]]; then
		zenity --info --text="Google Chrome is installed\!" --title=""	
	elif [[ $choice == "vivaldi" ]]; then
		zenity --info --text="Vivaldi is installed\!" --title=""	
	fi
fi
