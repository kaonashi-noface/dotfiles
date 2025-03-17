# Overview
This directory contains all of the core scripts for setting up an arch linux environment.

# Usage
First, we need to install core binaries such as:
* rust
* pyenv
* neovim
* wezterm
* zsh
* starship
* neofetch

These binaries are installed separately because they require `pacman` and elevated permissions (e.g. `sudo`). The other binaries will be installed using `paru`.

You can install `pacman` packages using the following script:
```sh
./install-core.sh
```

Next, we need to install `AUR` packages using `paru`. These `AUR` packages are used to configure:
* default browser (brave)
* node version manager
* zsh plugins

You can run the `AUR` configuration script with the following:
```sh
./setup.sh
```

Next, navigate to the "ui/window framework" of choice (e.g. `gnome`, `wayland`, `i3`, `sway`, etc.) and execute the following script:
```sh
cd gnome
./setup.sh
```

Each subdirectory contains a script that configures the `theme` of the desktop environment. These themes will contain configurations for icons, cursor, color schemes, etc.
Once these themes and plugins are installed, you can navigate to the root directory of this repository to configure your `zsh` and terminal (e.g. `wezterm`, `ghosty`, etc.).
