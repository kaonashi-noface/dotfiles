#!/bin/bash

########################################
# INITIALIZE BUILD ENVIRONMENT
########################################
# move to config directory
pushd "${XDG_CONFIG_HOME}"
########################################
# INITIALIZE WEZTERM CONFIG DIRECTORY
########################################
# setup wezterm config directory
rm -rf wezterm && mkdir wezterm
popd
########################################
# Copy wezterm config files
########################################
pushd configs
cp -R . "${XDG_CONFIG_HOME}/wezterm"
# navigate back to user home directory
pushd -0 && dirs -c
