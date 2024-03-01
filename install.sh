#!/bin/bash

DEFAULT_CONFIGS=( "alacritty" "kitty" "lf" "nvim" "skhd" "tmux" "yabai" "zsh" )
CONFIGS=()

help(){
	echo
	echo "Help for install.sh"
	echo
	echo "Syntax: ./install.sh -h(--help)|--no-backup|--all <configs>"
	echo "options:"
	echo "      -h  --help          print script help"
	echo "      --no-backup         install configs without backup old configs"
	echo "      --all               install all configs"
	echo
}

while [[ $# -gt 0 ]]; do
	case $1 in
		-h|--help)
			help
			exit;;
		--no-backup)
		NO_BACKUP=true
			shift;;
		--all)
			INSTALL_ALL=true
			shift;;
		-*|--*)
		echo "Unknown option $1"
			exit 1;;
		*)
			CONFIGS+=("$1")
			shift;;
	esac

done

clear_before_install(){
	local config=$1
	local create_folder=$2
	local backup="${config}_backup"
	rm -rf $backup
	if [[ -e $config ]]; then
		if [[ ! $NO_BACKUP ]]; then
			mv $config $backup
		fi
		rm -rf $config
	fi
	if [[ $create_folder == true ]]; then
		mkdir $config
	fi
}

is_mac(){
	local os=$(uname)
	if [ $os == "Darwin" ]; then
		echo true
	else 
		echo false
	fi
}

install() {
	local configs=("$@")
	local home_config=$HOME/.config
	local current_folder=$(pwd)
	local mac=$(is_mac)
	for config in ${configs[@]}
	do
		case "$config" in 
			alacritty)
				echo
				echo "Installing ${config} config"

				local alacritty_config_folder=$home_config/alacritty
				clear_before_install $alacritty_config_folder true
				ln -s $current_folder/alacritty/alacritty.toml $alacritty_config_folder/alacritty.toml
				ln -s $current_folder/alacritty/colors.toml $alacritty_config_folder/colors.toml

				if [[ $mac == "true" ]]; then
					ln -s $current_folder/alacritty/macos.toml $alacritty_config_folder/os.toml
				else 
					ln -s $current_folder/alacritty/linux.toml $alacritty_config_folder/os.toml
				fi

				echo "${config} config was installed"
				;;
			kitty)
				echo
				echo "Installing ${config} config"

				local kitty_config_folder=$home_config/kitty
				clear_before_install $kitty_config_folder true
				ln -s $current_folder/kitty/kitty.conf $kitty_config_folder/kitty.conf
				ln -s $current_folder/kitty/colors.conf $kitty_config_folder/colors.conf

				if [[ $mac == "true" ]]; then
					ln -s $current_folder/kitty/macos.conf $kitty_config_folder/os.conf
				else 
					ln -s $current_folder/kitty/linux.conf $kitty_config_folder/os.conf
				fi

				echo "${config} config was installed"
				;;
			lf)
				echo
				echo "Installing ${config} config"

				local lf_config_folder=$home_config/lf
				clear_before_install $lf_config_folder false

				ln -s $current_folder/lf $lf_config_folder

				echo "${config} config was installed"
				;;
			nvim)
				echo
				echo "Installing ${config} config"

				local nvim_config_folder=$home_config/nvim
				clear_before_install $nvim_config_folder false

				ln -s $current_folder/nvim $nvim_config_folder

				echo "${config} config was installed"
				;;
			skhd)
				if [[ $mac == "true" ]]; then
					echo
					echo "Installing ${config} config"

					local skhd_config_folder=$home_config/skhd
					clear_before_install $skhd_config_folder false

					ln -s $current_folder/skhd $skhd_config_folder

					echo "${config} config was installed"
				fi 
				;;
			tmux)
				echo
				echo "Installing ${config} config"

				local tmux=$HOME/.tmux.conf
				clear_before_install $tmux false

				ln -s $current_folder/tmux/tmux.conf $tmux

				echo "${config} config was installed"

				;;
			yabai)
				if [[ $mac == "true" ]]; then
					echo
					echo "Installing ${config} config"

					local yabai_config_folder=$home_config/yabai
					clear_before_install $yabai_config_folder false

					ln -s $current_folder/yabai $yabai_config_folder

					echo "${config} config was installed"
				fi 
				;;
			zsh)
				if [[ $mac == "true" ]]; then
					echo
					echo "Installing ${config} config"

					local zsh=$HOME/.zshrc
					local theme=$HOME/.oh-my-zsh/custom/themes/eojysele.zsh-theme
					clear_before_install $zsh false
					clear_before_install $theme false

					ln -s $current_folder/zsh/eojysele.zsh-theme $theme
					ln -s $current_folder/zsh/zshrc $zsh

					echo "${config} config was installed"
				fi 
				;; 
		esac
	done
}

if [[ ${CONFIGS} ]]; then
	echo "Start installing selection configs"
	install ${CONFIGS[@]}
	echo
	echo "Finish install selection configs"
elif [[ ${INSTALL_ALL} ]]; then
	echo "Start install all configs"
	install ${DEFAULT_CONFIGS[@]}
	echo
	echo "Finish install all configs"
else 
	echo "Use -h|--help"
fi

