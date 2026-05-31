{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    niri = "niri";
    nvim = "nvim";
    ghostty = "ghostty";
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
        ls = "eza --icons --group-directories-first";

        ll = "eza -l --icons --git --group-directories-first"; 
        la = "eza -a --icons --group-directories-first";       
        lt = "eza --tree --level=2 --icons";                  
	    };

	    history.size = 10000;
	    history.ignoreAllDups = true;
	    history.path = "$HOME/.zsh_history";
	    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

     #  initContent = lib.mkAfter ''
     #    alias ls="eza --icons --group-directories-first"
     #    alias ll="eza -l --icons --git --group-directories-first"
     #    alias la="eza -a --icons --group-directories-first"
     #    alias lt="eza --tree --level=2 --icons"
     #  '';

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

  programs.tmux = {
    enable = true;
    # Set your existing custom config here
    extraConfig = ''
set -g default-terminal "tmux-256color"
    set -ag terminal-overrides ",xterm-256color:RGB"
    set -g pane-active-border-style fg=brightgreen

    set-option -g default-terminal "tmux-256color"
    set-option -sa terminal-overrides ',xterm-termite:RGB'

    set -g base-index 1
    setw -g pane-base-index 1

    unbind C-b
    set -g prefix C-Space
    bind C-Space send-prefix

    bind -n M-k resize-pane -U 5
    bind -n M-j resize-pane -D 5
    bind -n M-h resize-pane -L 5
    bind -n M-l resize-pane -R 5

    # Catppuccin and other plugin settings go here
    set -g @catppuccin_window_status_style "rounded"
    set -g status-right-length 100
    set -g status-left-length 100
    set -g status-left ""
    set -g status-right "#{E:@catppuccin_status_application}"
    set -agF status-right "#{E:@catppuccin_status_cpu}"
    set -ag status-right "#{E:@catppuccin_status_session}"
    set -ag status-right "#{E:@catppuccin_status_uptime}"
    set -agF status-right "#{E:@catppuccin_status_battery}"
    '';
  
    # Declare your plugins here
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor 'mocha'
          set -g @catppuccin_window_status_style "rounded"
        '';
      }
      {
        plugin = tmux-which-key; # Note: Ensure this is available in your nixpkgs version
      }
    ];
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  
  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

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
    pkgs-unstable.quickshell
  ];
}
