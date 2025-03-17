#!/bin/bash

# Install core libraries and modules
pacman -S git \
    rustup \
    pyenv \
    neovim \
    wezterm \
    zsh \
    starship \
    neofetch

# Setup Rust
rustup default stable
