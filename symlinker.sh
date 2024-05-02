#!/bin/bash

dotfiles_dir=~/dotfiles
log_file=~/install_prog_log.txt

# Create symlink for terminal stuff
if [ -d ~/.config/alacritty ]; then
    if [ -L ~/.config/alacritty ]; then
        echo "Alacritty symlink already exists. Skipping..."
    else
        echo "Alacritty config already exists. Attempting to merge..."
        cp -ai ~/.config/alacritty $dotfiles_dir/terminal/alacritty 
    fi
else
    echo "Alacritty config does not exist yet. Copying directly from dotfiles..."
fi
ln -sf $dotfiles_dir/terminal/alacritty ~/.config
