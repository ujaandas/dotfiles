#!/bin/bash

# Constants
dotfiles_dir=~/dotfiles
log_file=~/install_prog_log.txt

# Symlink + Extras function
function createSymLink() {
	# Rename arguments
	program_name=$1
	old_loc=$2
	new_loc=$3

	if [ -L $old_loc ]; then
		if [ -e $old_loc ]; then
			echo "$program_name has a good link, skipping..."
		else
			echo "$program_name has a broken link, re-establishing..."
			ln -sfn $new_loc ~/.config/
		fi
	elif [ -e $old_loc ]; then
		echo "$program_name exists in $old_loc but is not linked, creating a new link..."
		cp -ai $old_loc $(dirname "$new_loc")
		rm -rfi $old_loc
		ln -sf $new_loc ~/.config/
	else
		echo "$program_name not found in $old_loc, creating a new link..."
		ln -sf $new_loc ~/.config/
	fi

}

createSymLink "Alacritty" ~/.config/alacritty ~/dotfiles/terminal/alacritty
createSymLink "Nvim" ~/.config/nvim ~/dotfiles/apps/nvim
