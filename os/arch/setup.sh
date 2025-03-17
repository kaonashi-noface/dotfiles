#!/bin/bash

########################################
# INITIALIZE BUILD ENVIRONMENT
########################################
# move to user home directory
pushd ~

# Change default shell to zsh
chsh -s $(which zsh)

# setup temp build environment
rm -rf build && mkdir build
pushd build

########################################
# INSTALL AUR PACKAGE MANAGER
########################################
git clone https://aur.archlinux.org/paru.git
pushd paru
makepkg -si

########################################
# AUR PACKAGES
########################################
# Install AUR packages
paru -S brave-bin \
    pokemon-colorscripts-git
# Setup Preferred Applications
xdg-settings set default-web-browser brave-browser.desktop
########################################
# INSTALL RUNTIME ENVIRONMENTS
########################################
# Setup Node Version Manager (NVM)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
# install & set default of latest version
nvm install node

########################################
# CLEAN BUILD ENVIRONMENT
########################################
# navigate back to user home directory
popd

# clean temp guild environment
rm -rf build
########################################
# INSTALL ZSH PLUGINS
########################################
# setup zsh plugins directory
rm -rf .config/zsh
mkdir .config/zsh
pushd .config/zsh

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-history-substring-search.git
git clone https://github.com/chrissicool/zsh-256color.git
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git

# navigate back to user home directory
pushd -0 && dirs -c
