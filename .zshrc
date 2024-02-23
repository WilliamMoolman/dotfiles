## Oh my ZSH init
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"

zsh_theme=""
completion_waiting_dots="true"
disable_untracked_files_dirty="true"
ls_colors=${ls_colors/:ow=*([^:]):/:ow=:}

plugins=(git autoenv zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Prompt
eval "$(starship init zsh)"

# Source configs
for config (~/.config/zsh/*.zsh) source $config

