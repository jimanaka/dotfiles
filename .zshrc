# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# keep active virtual envs for tmux
if [[ -n "$VIRTUAL_ENV" && "$PATH" != *"$VIRTUAL_ENV/bin"* ]]; then
  source "$VIRTUAL_ENV/bin/activate"
fi

source /usr/share/fzf/shell/key-bindings.zsh

alias vim='nvim'
alias nv='nvim'

export EDITOR=nvim
export VISUAL=nvim
export PATH="$HOME/.local/bin:$PATH"
