#!/usr/bin/env bash
#
# Script name: browserinstall
# Description: Install various browsers in Ubuntu Linux
# Dependencies: rofi or dmenu and Ubuntu
# Contributors: RitchielRez
#

# An array of browser names. You can edit htis list to add/remove
# search engines. The format must be: [browser_executable_name]="Browser Name".
declare -a options
options[brave-browser]="Brave"
options[chromium-browser]="Chromium"
options[firefox]="Firefox"
options[google-chrome]="Google Chrome"
options[vivaldi]="Vivaldi"


