#!/usr/bin/env bash

rm ~/.zshrc
ln -s ~/Documents/DEV/dotfiles/.zshrc ~/.zshrc

rm ~/.zprofile
ln -s ~/Documents/DEV/dotfiles/.zprofile ~/.zprofile

rm ~/.ignore
ln -s ~/Documents/DEV/dotfiles/.ignore ~/.ignore

rm -rf ~/.config/nvim
ln -s ~/Documents/DEV/dotfiles/nvim ~/.config/nvim

rm -rf ~/.local/scripts
ln -s ~/Documents/DEV/dotfiles/scripts ~/.local/scripts

rm ~/.tmux.conf
ln -s ~/Documents/DEV/dotfiles/.tmux.conf ~/.tmux.conf

rm ~/.wezterm.lua
ln -s ~/Documents/DEV/dotfiles/.wezterm.lua ~/.wezterm.lua

rm ~/.config/starship.toml
ln -s ~/Documents/DEV/dotfiles/starship.toml ~/.config/starship.toml
