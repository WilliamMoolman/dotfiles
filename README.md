# Dotfiles
My dotfiles are now managed with GNU stow. This is done by having all the dotfiles in central `dotfiles` directory, and creating symlinks to the config file locations.

## Requirements
GNU Stow:
```
apt install stow # Debian/Ubuntu
pacmac -S stow # Arch
```

## Installation
Installing dotfiles in a new machine is done by:
```sh
git clone git@github.com:WilliamMoolman/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --adopt .
```
Any difference between the cloned files and those existing will appear as modification to files in the dotfiles directory. Run `git status` to check

To add a file to the dotfiles, run:
```sh
dot ~/.config/sample.conf
```

To remove a file from the dotfiles, run:
```sh
mv ~/dotfiles/.config/sample.conf ~/.config/sample.conf
```

To delete a file entirely, delete the version in the `dotfiles` directory, and then restow:
```sh
~/dotfiles $ stow -R .
```
