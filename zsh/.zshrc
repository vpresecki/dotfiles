export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS="true"

plugins=(chucknorris git colored-man-pages vi-mode)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Prompt s bojama
# export PS1="%F{blue}%n@%M%f:%F{green}%~%f%# "

# CUSTOM
export EDITOR="nvim"

alias vim=nvim
alias zshrc='nvim ~/.zshrc'	
alias vim-tmux='nvim ~/.config/tmux/tmux.conf'
alias stmux='tmux source ~/.config/tmux/tmux.conf'
alias ssh-eurodata='ssh -i ~/.ssh/vedran@tahoma.hr v.presecki@edsb@edcloud-admin-srv1a.lx.eurodata.de'
alias ssh-tms-cassandra='ssh -J v.presecki@edsb@edcloud-admin-srv1a.lx.eurodata.de -i ~/.ssh/vedran@tahoma.hr v.presecki@edsb@tms-cassandra4-p.lx.eurodata.de'
alias ssh-cloud-avence='ssh -i ~/.ssh/vp@avence.hr vpresecki@cloud-vps.avence.hr'

# Provjeri operativni sustav (macOS ili Linux)
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS specifične postavke
  export PATH="/opt/homebrew/bin:$PATH"
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux specifične postavke
  export PATH="/usr/local/bin:$PATH"
  if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
  if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi
fi

# SDKMAN inicijalizacija (ako postoji)
if [ -f "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
