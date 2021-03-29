DMEDITOR="konsole -e vim"

declare -a options=(
"bash - $HOME/.bashrc"
"fusuma - $HOME/.config/fusuma/config.yml"
"rofi - $HOME/.config/rofi/config"
"vim - $HOME/.vimrc"
"quit"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p "Search config")

if [ "$choice" == "quit" ]; then
	zenity --warning --text="Progarm terminated\!" --title="!!!"
	exit 1

elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	$DMEDITOR "$cfg"

else
	zenity --warning --text="Progarm terminated\!" --title="!!!"
	exit 1
fi

