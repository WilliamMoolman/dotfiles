# history setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh_history
SAVEHIST=100000
HISTSIZE=99999
setopt HIST_EXPIRE_DUPS_FIRST

# autocompletion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

bindkey '^[OA' history-search-backward
bindkey '^[OB' history-search-forward
