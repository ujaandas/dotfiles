#!/bin/bash

# Constants
dotfiles_dir=~/dotfiles
log_file=~/install_prog_log.txt

# Symlink + Extras function
function createSymLink () {
    # Rename arguments
    program_name=$1
    old_loc=$2
    new_loc=$3

    if ! [ -L $old_loc ]; then
	if [ -d $old_loc ]; then
            echo "$program_name config already exists. Attempting to merge..."
            cp -ai $old_loc $new_loc 
        else
	    echo "$program_name config does no t exist yet. Copying directly from dotfiles..."
	fi
	ln -sf $new_loc ~/.config
	return 1
    fi
    echo "$program_name symlink already exists. Skipping..."
    return 0
}

createSymLink "Alacritty" ~/.config/alacritty ~/dotfiles/terminal/alacritty
