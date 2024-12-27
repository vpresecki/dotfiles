#!/bin/bash

# Lokacija dotfiles
DOTFILES_DIR=~/dotfiles

# Kreiraj simboličke linkove za konfiguracije
ln -sf $DOTFILES_DIR/nvim ~/.config/nvim
ln -sf $DOTFILES_DIR/tmux ~/.config/tmux
ln -sf $DOTFILES_DIR/wezterm ~/.config/wezterm
ln -sf $DOTFILES_DIR/zsh ~/.config/zsh
ln -sf $DOTFILES_DIR/zsh/.zshrc ~/.zshrc

# Instaliraj ovisnosti (Oh My Zsh, dodatci, SDKMAN, tmux)
if ! command -v zsh &> /dev/null; then
  echo "Instaliram Zsh..."
  sudo apt install -y zsh
fi

if [ ! -d ~/.oh-my-zsh ]; then
  echo "Instaliram Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  echo "Instaliram zsh-syntax-highlighting..."
  sudo apt install -y zsh-syntax-highlighting
fi

if [ ! -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  echo "Instaliram zsh-autosuggestions..."
  sudo apt install -y zsh-autosuggestions
fi

if [ ! -f ~/.sdkman/bin/sdkman-init.sh ]; then
  echo "Instaliram SDKMAN..."
  curl -s "https://get.sdkman.io" | bash
fi

if ! command -v tmux &> /dev/null; then
  echo "Instaliram tmux..."
  sudo apt install -y tmux
fi

# Učitaj nove Zsh postavke
if [ -f ~/.zshrc ]; then
  echo "Učitavam Zsh postavke..."
  source ~/.zshrc
fi

# Učitaj tmux konfiguracije
if command -v tmux &> /dev/null; then
  echo "Učitavam tmux konfiguracije..."
  tmux source-file ~/.config/tmux/tmux.conf
fi

echo "Dotfiles konfiguracije su postavljene i aktivirane!"
