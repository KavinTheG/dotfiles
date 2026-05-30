{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    niri = "niri";
    nvim = "nvim";
    ghostty = "ghostty";
    tmux = "tmux";
  };
in 
{
	home.username = "kavin";
	home.homeDirectory = "/home/kavin";
	home.stateVersion = "25.11";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "Kavin Gnanapandithan";
        email = "kavin.balag@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };


	programs.zsh = {
	    enable = true;
	    enableCompletion = true;
	    autosuggestion.enable = true;
	    syntaxHighlighting.enable = true;

	    shellAliases = {
        setup = "tmux new-session -d; tmux send-keys \"nvim\" C-m; tmux new-window; tmux select-window -t 0; tmux attach-session";
	    };

	    history.size = 10000;
	    history.ignoreAllDups = true;
	    history.path = "$HOME/.zsh_history";
	    history.ignorePatterns = ["rm *" "pkill *" "cp *"];
  };

  programs.vim = {
    enable = true;
    # This sets your specific vimrc content
    extraConfig = ''
      filetype plugin indent on
      set expandtab
      set shiftwidth=4
      set softtabstop=4
      set tabstop=2
      set number
      set relativenumber
      set smartindent
      set showmatch
      set backspace=indent,eol,start
      syntax on
    '';
  };
  
  # programs.niri = {
  #    enable = true;
  #    package = pkgs-unstable.niri;
  # };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };
  
  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
  # xdg.configFile."niri"    = { source = create_symlink "${dotfiles}/niri";    recursive = true; };
  # xdg.configFile."ghostty" = { source = create_symlink "${dotfiles}/config/ghostty"; recursive = true; };
  # xdg.configFile."nvim"    = { source = create_symlink "${dotfiles}/config/nvim";    recursive = true; };
  # xdg.configFile."tmux"    = { source = create_symlink "${dotfiles}/config/tmux";    recursive = true; };

	programs.vesktop.enable = true;

  home.packages = with pkgs; [
    fastfetch
    ghostty
    grim
    slurp
    wl-clipboard
    binutils

    tmux

    neovim
    ripgrep
    fd
    curl
    gcc

    lazygit
    fzf

  ] ++ [
    pkgs-unstable.awww 
  ];
}
