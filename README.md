# dotfiles

This repository contains my personal dotfiles for managing various configurations using [GNU Stow](https://www.gnu.org/software/stow/). The setup includes configurations for 

- alacritty
- hyprland
- matugen
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
  sudo pacman -S stow hyprland nvim waybar wezterm
```

I am currently using `matugen` for the palette generator. It can be installed with an AUR helper, or with cargo.  

My nvim config is just the lazyvim starter with a few additional plugins 

## Usage

Ensure that a `dotfiles` directory exists in `$HOME/`, and that any existing files in `dotfiles/` do not already exist in `$HOME/.config/`.  
It’s a good idea to back them up before deleting or replacing them.

```
cd ~/dotfiles
git clone git@github.com:KavinTheG/dotfiles.git
stow .
```
