autoload -U compinit && compinit

# Prompt
eval "$(starship init zsh)"

# Source configs
for config (~/.config/zsh/*.zsh) source $config

