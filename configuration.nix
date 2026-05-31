{ config, lib, inputs, pkgs, pkgs-unstable,  ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; 
  
  nixpkgs.config.allowUnfree = true;

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
  
  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  time.timeZone = "America/Toronto";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  users.users.kavin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };

  hardware.graphics = {
	  enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
      libvdpau-va-gl
    ];
  };

  # NVIDIA settings
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Wayland compositors variable for NVIDIA
  environment.variables = {
    LIBVA_DRIVER_NAME="nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_SHADER_DISK_CACHE = "1";
    __GL_SHADER_DISK_CACHE_PATH = "/home/kavin/.cache/nvidia/GLCache";
  };

  environment.shellAliases = {
    ls = null;
  };

  services.displayManager.ly.enable = true;
  programs.niri = {
    enable = true;
    package = pkgs-unstable.niri; 
  };

  programs.zsh.enable = true;
  programs.xwayland.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    zlib
    stdenv.cc.cc
  ];

  security.rtkit.enable = true;

  programs.firefox.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
      pkgs.xdg-desktop-portal-wlr
      ];
    config.common.default = "wlr";
    config.niri.default = "wlr;gtk";
  };

  systemd.user.services.xdg-desktop-portal-gnome.enable = false;

  # Steam settings
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  programs.gamemode.enable = true;
  hardware.steam-hardware.enable = true;

  fonts.packages = with pkgs; [
    corefonts
    vista-fonts 
    dejavu_fonts
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.sauce-code-pro
  ];

  environment.systemPackages = with pkgs; [
    vim 
    git
    wget
    alacritty
    fuzzel

    mangohud
    protonup-ng
    xwayland-satellite

    eza

    # Wine
    wine
    winetricks
    protontricks
    vulkan-tools

    SDL2
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11"; # Did you read the comment?

}

