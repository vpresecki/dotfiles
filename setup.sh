#!/bin/bash

# Lokacija dotfiles
DOTFILES_DIR=~/dotfiles

# Prepoznaj operativni sustav
if [[ "$OSTYPE" == "darwin"* ]]; then
  OS="macOS"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS="Ubuntu"
else
  echo "Ova skripta podržava samo iOS i Ubuntu."
  exit 1
fi

echo "Pokrećem instalaciju za $OS..."

# Provjera i instalacija Homebrew (samo za macOS)
if [[ $OS == "macOS" ]]; then
  if ! command -v brew &> /dev/null; then
    echo "Instaliram Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew je već instaliran."
  fi
fi

# Provjera i instalacija Zsh
if ! command -v zsh &> /dev/null; then
  echo "Zsh nije instaliran. Instaliram Zsh..."

  if [[ $OS == "macOS" ]]; then
    echo "Instaliram Zsh s Homebrew..."
    brew install zsh
  elif [[ $OS == "Ubuntu" ]]; then
    echo "Instaliram Zsh s apt..."
    sudo apt update
    sudo apt install -y zsh
  fi
else
  echo "Zsh je već instaliran."
fi

# Postavljanje Zsh kao zadani shell
if [ "$SHELL" != "$(command -v zsh)" ]; then
  echo "Postavljam Zsh kao zadani shell..."
  command -v zsh | sudo tee -a /etc/shells
  chsh -s $(command -v zsh)
fi

# Prebaci se na Zsh za ostatak skripte
if [ -z "$ZSH_VERSION" ]; then
  echo "Switching to Zsh to execute the rest of the script..."
  exec zsh "$0" "$@"
  exit
fi

# Provjera i instalacija Oh My Zsh
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Instaliram Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Provjera i instalacija tmux
if ! command -v tmux &> /dev/null; then
  echo "Instaliram tmux..."
  if [[ $OS == "macOS" ]]; then
    brew install tmux
  elif [[ $OS == "Ubuntu" ]]; then
    sudo apt install -y tmux
  fi
fi

# Provjera i instalacija Neovim
if ! command -v nvim &> /dev/null; then
  echo "Instaliram Neovim..."
  if [[ $OS == "macOS" ]]; then
    brew install neovim
  elif [[ $OS == "Ubuntu" ]]; then
    sudo apt install -y neovim
  fi
else
  echo "Neovim je već instaliran."
fi

# Specifične postavke za macOS
if [[ $OS == "macOS" ]]; then
  echo "Postavljam macOS specifične ovisnosti..."
  brew install zsh-syntax-highlighting zsh-autosuggestions

  # Link plugins to Oh My Zsh custom plugins directory
  mkdir -p ~/.oh-my-zsh/custom/plugins
  ln -sf /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
  ln -sf /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Specifične postavke za Ubuntu
elif [[ $OS == "Ubuntu" ]]; then
  echo "Postavljam Ubuntu specifične ovisnosti..."
  sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions

  # Link or source plugins
  if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    ln -sf /usr/share/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
  fi
  if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    ln -sf /usr/share/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
  fi
fi

# Kreiraj simboličke linkove za konfiguracije
echo "Postavljam simboličke linkove za konfiguracije..."

mkdir -p ~/.config/nvim
ln -sfn $DOTFILES_DIR/nvim ~/.config/nvim

mkdir -p ~/.config/tmux
ln -sf $DOTFILES_DIR/tmux ~/.config/tmux

mkdir -p ~/.config/zsh
ln -sf $DOTFILES_DIR/zsh ~/.config/zsh

mkdir -p ~/.config/ghostty
ln -sf $DOTFILES_DIR/ghostty/config ~/.config/ghostty/config

# Učitaj nove Zsh postavke
if [ -f ~/.zshrc ]; then
  echo "Učitavam Zsh postavke..."
  source ~/.zshrc
fi

# Učitaj tmux konfiguracije ako je pokrenut
if command -v tmux &> /dev/null; then
  if tmux info &> /dev/null; then
    echo "Učitavam tmux konfiguracije..."
    tmux source-file ~/.config/tmux/tmux.conf
  else
    echo "Tmux nije pokrenut, preskačem učitavanje konfiguracije."
  fi
fi

echo "Konfiguracija za $OS je dovršena!"
