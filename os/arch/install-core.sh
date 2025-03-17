#!/bin/bash

# More Nerd Fonts on Arch Linux:
# https://archlinux.org/groups/any/nerd-fonts/

# Install core libraries and modules
pacman -S git \
    rustup \
    pyenv \
    neovim \
    wezterm \
    zsh \
    starship \
    neofetch \
    ttf-meslo-nerd

# Setup Rust
rustup default stable

# Reload Font Cache (e.g. Nerd Fonts)
fc-cache -f -v
