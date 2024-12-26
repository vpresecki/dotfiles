#!/bin/bash

DOTFILES_DIR=~/dotfiles

ln -sf $DOTFILES_DIR/nvim ~/.config/nvim
ln -sf $DOTFILES_DIR/tmux ~/.config/tmux
ln -sf $DOTFILES_DIR/wezterm ~/.config/wezterm
ln -sf $DOTFILES_DIR/zsh ~/.config/zsh

echo "Dotfiles config done!"
