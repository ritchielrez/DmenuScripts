#!/bin/bash

if command -v pacman &> /dev/null
then
	sudo pacman -S github-cli git exa stow figlet lolcat base-devel
elif command -v apt-get &> /dev/null
then
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
	sudo add-apt-repository ppa:mmstick76/alacritty -y
	sudo apt update
	sudo apt-get install alacritty gh stow git figlet -y
	sudo apt install ./discord-canary-0.0.131.deb -y
	sudo sh -c "curl -sfLS https://install-node.vercel.app | bash -s --"

	# VSCode
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg
	sudo apt install apt-transport-https -y
	sudo apt update
	sudo apt install code -y
fi

figlet "Installed"

