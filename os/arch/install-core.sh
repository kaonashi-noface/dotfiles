#!/bin/bash

# More Nerd Fonts on Arch Linux:
# https://archlinux.org/groups/any/nerd-fonts/

# Install core libraries and modules
pacman -S git \
    rustup \
    pyenv \
    go \
    dotnet-runtime \
    dotnet-sdk \
    delve \
    code \
    neovim \
    wezterm \
    zsh \
    starship \
    neofetch \
    ttf-meslo-nerd

# Setup Rust
rustup default stable
rustup component add rust-analyzer

# Setup Deno
curl -fsSL https://dvm.deno.dev | sh
dvm install

# Reload Font Cache (e.g. Nerd Fonts)
fc-cache -f -v
