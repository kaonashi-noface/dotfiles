#!/bin/bash

########################################
# INITIALIZE BUILD ENVIRONMENT
########################################
# move to user home directory
pushd ~
# setup temp build environment
rm -rf build && mkdir build
########################################
# INSTALL GNOME PACKAGES
########################################
pushd build
# Install Gnome Extensions
paru -S extension-manager \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-dash-to-dock

declare -A gtk_packages
gtk_packages["Dracula"]="dracula/gtk/archive/master"
gtk_packages["Sweet"]="EliverLara/Sweet/archive/master"
gtk_packages["Sweet-Ambar-Blue-Dark"]="EliverLara/Sweet/archive/Ambar-Blue-Dark"
gtk_packages["candy-icons"]="EliverLara/candy-icons/archive/master"

for target_dir in "${!gtk_packages[@]}"; do
    curl -L -o "${target_dir}.zip" "https://github.com/${gtk_packages[$target_dir]}/.zip"
    src_dir="$(unzip -Z -1 ${target_dir}.zip | head -1)"
    unzip "${target_dir}.zip" && mv $src_dir $target_dir
    rm -f "${target_dir}.zip"
done
popd
########################################
# STAGE GNOME PACKAGES
########################################
# Stage downloaded themes for loading
rm -rf .themes && mkdir .themes
cp -R build/Dracula ~/.themes
cp -R build/Sweet ~/.themes
cp -R "build/Sweet-Ambar-Blue-Dark" ~/.themes

# Stage downloaded icons for loading
rm -rf .icons && mkdir .icons
cp -R "build/candy-icons" .icons # temp workaround for nvim autoformatting "-"
########################################
# CONFIGURE GNOME SETTINGS
########################################
# Setup Preferred Gnome Settings
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

# Enable Dracula Theme
#dconf write /org/gnome/shell/extensions/user-theme/name "'Dracula'"
#gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
#gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
#cp -R .themes/Dracula/assets ~/.config
#cp -R .themes/Dracula/gtk-4.0/gtk.css ~/.config/gtk-4.0
#cp -R .themes/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0
# Enable Sweet Theme
# dconf write /org/gnome/shell/extensions/user-theme/name "'Sweet'"
# gsettings set org.gnome.desktop.interface gtk-theme "Sweet"
# gsettings set org.gnome.desktop.wm.preferences theme "Sweet"
# cp -R .themes/Sweet/assets ~/.config
# cp -R .themes/Sweet/gtk-4.0/gtk.css ~/.config/gtk-4.0
# cp -R .themes/Sweet/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0
# Enable Sweet Ambar Blue Theme
# Enable Sweet Theme
dconf write /org/gnome/shell/extensions/user-theme/name "'Sweet-Ambar-Blue-Dark'"
gsettings set org.gnome.desktop.interface gtk-theme "Sweet-Ambar-Blue-Dark"
gsettings set org.gnome.desktop.wm.preferences theme "Sweet-Ambar-Blue-Dark"
cp -R ".themes/Sweet-Ambar-Blue-Dark/assets" ~/.config
cp -R ".themes/Sweet-Ambar-Blue-Dark/gtk-4.0/gtk.css" ~/.config/gtk-4.0
cp -R ".themes/Sweet-Ambar-Blue-Dark/gtk-4.0/gtk-dark.css" ~/.config/gtk-4.0
# Enable Candy Icons
gsettings set org.gnome.desktop.interface icon-theme "candy-icons"
########################################
# CLEAN BUILD ENVIRONMENT
########################################
# clean temp guild environment
rm -rf build
pushd -0 && dirs -c
