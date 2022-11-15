#!/bin/bash

mkdir -p ~/.config/
ln -s ${PWD}/.gitconfig ~/
ln -s ${PWD}/.gitignore ~/
ln -s ${PWD}/.global_ignore ~/
ln -s ${PWD}/.tmux.conf ~/
ln -s ${PWD}/.tmuxline.conf ~/
ln -s ${PWD}/.zshenv ~/
ln -s ${PWD}/.config/archey4 ~/.config/
ln -s ${PWD}/.config/environment.d ~/.config/
ln -s ${PWD}/.config/flake8 ~/.config/
ln -s ${PWD}/.config/htop ~/.config/
ln -s ${PWD}/.config/kitty ~/.config/
ln -s ${PWD}/.config/nvim ~/.config/
ln -s ${PWD}/.config/zsh ~/.config/

mkdir -p ~/.ssh/
chmod 700 ~/.ssh/
ln -s ${PWD}/.ssh/config ~/.ssh/

mkdir -p ~/.gnupg/
chmod 700 ~/.gnupg/
ln -s ${PWD}/.gnupg/* ~/.gnupg/
