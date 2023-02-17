#!/bin/bash

mkdir -p ~/.config/
ln -s ${PWD}/.gitconfig ~/
ln -s ${PWD}/.global_ignore ~/

ln -s ${PWD}/.config/archey4 ~/.config/
ln -s ${PWD}/.config/environment.d ~/.config/
ln -s ${PWD}/.config/flake8 ~/.config/
ln -s ${PWD}/.config/fish ~/.config/
ln -s ${PWD}/.config/htop ~/.config/
ln -s ${PWD}/.config/kitty ~/.config/
ln -s ${PWD}/.config/nvim ~/.config/
ln -s ${PWD}/.config/zsh ~/.config/
ln -s ${PWD}/.config/starship.toml ~/.config/

mkdir -p ~/.ssh/
chmod 700 ~/.ssh/
ln -s ${PWD}/.ssh/config ~/.ssh/

mkdir -p ~/.gnupg/
chmod 700 ~/.gnupg/
ln -s ${PWD}/.gnupg/* ~/.gnupg/

ln -s ${HOME}/Dropbox/bin ~/.bin
