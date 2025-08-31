
plugins=(git zsh-autosuggestions zsh-syntax-highlighting history-substring-search)
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jimanaka/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# 
. "$HOME/.cargo/env"

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
