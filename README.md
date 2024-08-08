# dotfiles

This repository contains my personal dotfiles for managing various configurations using [GNU Stow](https://www.gnu.org/software/stow/). The setup includes configurations for 

- alacritty
- hyprland
- wal
- waybar
- nvim
 
 The repository is organized with a `.config` directory and a `.zshrc` file at the root level.

## Structure

The repository is organized as follows:

```plaintext
dotfiles/
├── .config/
│   ├── alacritty/
│   ├── dunst/
│   ├── hypr/
│   ├── wal/
│   ├── waybar/
│   └── nvim/
└── .zshrc
```

## Prerequisites

Ensure you have the following software installed:

  ```bash
  sudo pacman -S stow hyprland, nvim, waybar, alacritty
```

pywal-16 must be used instead of the regular pywal. The instruction guide can be found in its github wiki page.

## Usage

Ensure that a dotfiles directory exists in $HOME/ and any existing files in dotfiles/ do not exist in $/HOME/.config/. It would be wise to make copies of these files instead of immediately deleting them.

```
cd ~/dotfiles
git clone git@github.com:KavinTheG/dotfiles.git
stow .
```