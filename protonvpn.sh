#!/usr/bin/env bash

IsVpnRunning=$($HOME/Documents/pvpnmon2/check.sh)

echo $IsVpnRunning

if [ "$IsVpnRunning" == "no" ]; then
	zenity --info --text="VPN connection terminated" --title="ProtonVPN\!"
fi
