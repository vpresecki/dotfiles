export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS="true"

plugins=(zsh-autosuggestions zsh-syntax-highlighting colored-man-pages)

export LANG=en_US.UTF-8

# Prompt s bojama
# export PS1="%F{blue}%n@%M%f:%F{green}%~%f%# "

# CUSTOM
export EDITOR="nvim"

alias vim=nvim
alias zshrc='nvim ~/dotfiles/zsh/.zshrc'	
alias vim-tmux='nvim ~/.config/tmux/tmux.conf'
alias stmux='tmux source ~/.config/tmux/tmux.conf'
alias ssh-eurodata='ssh -i ~/.ssh/vedran@tahoma.hr v.presecki@edsb@edcloud-admin-srv1a.lx.eurodata.de'
alias ssh-tms-cassandra='ssh -J v.presecki@edsb@edcloud-admin-srv1a.lx.eurodata.de -i ~/.ssh/vedran@tahoma.hr v.presecki@edsb@tms-cassandra4-p.lx.eurodata.de'
alias ssh-cloud-avence='ssh -i ~/.ssh/vp@avence.hr vpresecki@cloud-vps.avence.hr'

# Provjeri operativni sustav (macOS ili Linux)
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export PATH="/usr/local/bin:$PATH"
fi

# SDKMAN inicijalizacija (ako postoji)
if [ -f "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh
