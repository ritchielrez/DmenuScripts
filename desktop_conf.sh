#!/bin/bash
#### Created by: Ritchiel Reza
#### Github profile: github.com/ritchielrez/
#### A script to set up my Linux desktop

### Install all the deps: 

if command -v pacman &> /dev/null
then

	sudo pacman -S github-cli git exa stow figlet lolcat base-devel vim wget

elif command -v apt-get &> /dev/null
then

 	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
 	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

 	sudo add-apt-repository ppa:mmstick76/alacritty -y
 	sudo apt update

 	sudo apt-get install alacritty gh stow git figlet unzip vim wget python3-pip -y

    # Discord canary
 	sudo apt install ./discord-canary-0.0.131.deb -y

    # Nodejs and npm
 	sudo sh -c "curl -sfLS https://install-node.vercel.app | bash -s --"
 
    # Zoom
        sudo apt install ./zoom_amd64.deb -y

 	# VSCode
 	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
 	sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
 	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
 	rm -f packages.microsoft.gpg
 	sudo apt install apt-transport-https -y
 	sudo apt update
 	sudo apt install code -y
	
	# Neovim
	sudo add-apt-repository ppa:neovim-ppa/unstable -y
	sudo apt update
	sudo apt install neovim -y

	# Spotify
	curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install spotify-client -y

  	# Auto-cpufreq
  	git clone https://github.com/AdnanHodzic/auto-cpufreq.git
  	cd auto-cpufreq && sudo ./auto-cpufreq-installer

fi
figlet "Main deps are Installed"

### Dotfiles
gh auth login

pushd ~
gh repo clone ritchielrez/dotfiles
cd ~/dotfiles

# Config vim
stow -vSt ~ vim

# Config git
rm ~/.gitconfig
stow -vSt ~ git

# Config alacritty
mv ~/.config/alacritty ~/.config/alacritty.okd
stow -vSt ~ alacritty
mkdir NerdFont && cd NerdFont
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip
sudo mv *.ttf /usr/share/fonts
sudo fc-cache -f -v

### Install powercord now
cd ~
git clone https://github.com/powercord-org/powercord
cd powercord
npm i
sudo npm run plug

# Discord nordic theme
gh repo clone gabe7384/Discord-nordic ~/powercord/src/Powercord/themes/Discord-nordic

### Install lunarvim
cd ~
wget https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh
chmod a+x install.sh

# Install the deps
sudo npm -g install neovim tree-sitter-cli
pip3 install pynvim

bash install.sh

### Install spicetify-cli
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R

curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh -o /tmp/install.sh
sh /tmp/install.sh

git clone https://github.com/morpheusthewhite/spicetify-themes.git ~/.config/spicetify/Themes

### Disable hardware accelaration for Spotify
mkdir -p ~/Documents/
sudo mv /usr/local/share/applications/spotify.desktop ~/Documents/spotify.desktop.bak
sudo mv /usr/share/applications/spotify.desktop ~/Documents/spotify.desktop.bak
mkdir -p ~/.local/share/applications/
popd && cp ./spotify.desktop ~/.local/share/applications/
sudo update-desktop-database

### Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

