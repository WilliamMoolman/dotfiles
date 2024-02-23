export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
#zmodload zsh/zprof

zsh_theme=""
completion_waiting_dots="true"
disable_untracked_files_dirty="true"
ls_colors=${ls_colors/:ow=*([^:]):/:ow=:}

plugins=(git autoenv zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Environmental Variables

export PATH="$HOME/.local/bin:$PATH"

export PATH="$PATH:/usr/local/go/bin"
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="/mnt/c/Vagrant"

export AUTOENV_ENV_FILENAME=".autoenv"
export AUTOENV_ENV_LEAVE_FILENAME=".autoenv.leave"
export AUTOENV_ENABLE_LEAVE="y"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="mvim"
fi

# Aliases
alias g="gsutil"
alias activvate="source ./venv/bin/activate >/dev/null 2>&1 || source ./.venv/bin/activate"
alias dice="ssh -F ~/.ssh/dice_config"
alias vim="nvim"
alias vi="nvim"
alias open="explorer.exe"

## KOperator Aliases
alias ksh-core='kubectl exec -it $( kubectl get pods -n koperator-test -o wide | grep core | cut -d" " -f1) --namespace koperator-test -c core -- /bin/bash'
ksh-enb() {
    kubectl exec -it koperator-test-enb-$1 -n koperator-test -c koperator-test-enb -- bash
}


######################## Environment Managers ######################################
# >>> conda initialize >>>
# !! Contents within this block are managed by "conda init" !!
__conda_setup="$("$HOME/miniconda3/bin/conda" "shell.zsh" "hook" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoenv_conda() {
    echo "conda activate $1" >> .autoenv
    echo "conda deactivate" >> .autoenv.leave
    echo "Added conda env $1 to .autoenv"
}

if [[ "$HOST" == "WTT" ]]; then
    nvm() {
        unset -f nvm
        export nvm_dir="$home/.nvm"
        [ -s "$nvm_dir/nvm.sh" ] && \. "$nvm_dir/nvm.sh"  # this loads nvm
        [ -s "$nvm_dir/bash_completion" ] && \. "$nvm_dir/bash_completion"  # this loads nvm bash_completion
       nvm "$@"
    }
else
    export nvm_dir="$home/.nvm"
    [ -s "$nvm_dir/nvm.sh" ] && \. "$nvm_dir/nvm.sh"  # this loads nvm
    [ -s "$nvm_dir/bash_completion" ] && \. "$nvm_dir/bash_completion"  # this loads nvm bash_completion
fi


# Prompt
eval "$(starship init zsh)"
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi

# dotfiles
# Function to adopt a file into a stow package
dot() {
    # Check for the correct number of arguments
    if [ $# -ne 1 ]; then
        echo "Usage: dot <file_path>" 
        return 1
    fi

    local file_path="$1"
    local dotfiles_dir="$HOME/dotfiles"

    # Create the target directory structure in ~/dotfiles
    local target_dir="$dotfiles_dir/$(dirname $file_path)"
    mkdir -p "$target_dir"

    # Move the file to the stow package directory
    mv "$file_path" "$target_dir/"

    # Use stow to symlink the file back to its original location
    cd "$dotfiles_dir" && stow "."
}

# Completion for adopt_to_stow function
_comp_dot() {
    _arguments "1:file path:_files" 
}

compdef _comp_dot dot

setopt HIST_IGNORE_SPACE
