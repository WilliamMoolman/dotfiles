# Check if its an ssh or https clone
if [ $1 == "ssh" ]; then
    git clone --bare git@github.com:WilliamMoolman/dotfiles.git $HOME/.dotfiles
else
    git clone --bare https://github.com/WilliamMoolman/dotfiles.git $HOME/.dotfiles
fi

function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .dotfiles-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | grep -E "\s+\." | awk "{ print $1 }" | xargs -I {} dirname {} | xargs -I{} mkdir -p .dotfiles-backup/{};
    config checkout 2>&1 | grep -E "\s+\." | awk "{ print $1 }" | xargs -I{} mv {} .dotfiles-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

