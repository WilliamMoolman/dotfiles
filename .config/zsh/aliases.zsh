# Aliases
alias g="gsutil"
alias activvate="source ./venv/bin/activate >/dev/null 2>&1 || source ./.venv/bin/activate"
alias dice="ssh -F ~/.ssh/dice_config"
alias vim="nvim"
alias vi="nvim"
alias open="explorer.exe"


autoenv_conda() {
    echo "conda activate $1" >> .autoenv
    echo "conda deactivate" >> .autoenv.leave
    echo "Added conda env $1 to .autoenv"
}

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi

if command -v bat >/dev/null 2>&1; then
    alias cat="bat"
fi

# dotfiles
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

_comp_dot() {
    _arguments "1:file path:_files" 
}

compdef _comp_dot do

# KOperator Aliases
alias ksh-core='kubectl exec -it $( kubectl get pods -n koperator-test -o wide | grep core | cut -d" " -f1) --namespace koperator-test -c core -- /bin/bash'
ksh-enb() {
    kubectl exec -it koperator-test-enb-$1 -n koperator-test -c koperator-test-enb -- bash
}
