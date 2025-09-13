# LIME-MOOSE NIXOS CONFIGURATION

{ config, lib, pkgs, ... }:

{
  imports = [./hardware-configuration.nix];

  # Boot
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    }; # Bootloader: Systemd Boot
    kernelPackages = pkgs.linuxPackages_latest;
 };

  # Networking
  networking = {
    hostName = "io";
    networkmanager.enable = true;
  };

  # Time & Locale
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_GB.UTF-8";

  # System Applications
  programs = {
    zsh.enable = true; # System Shell: Zsh
    nano.enable = false;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true; 
    }; # Editor: NeoVim
  };

  # User Account
  users.users.ikrsh = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      distrobox
      nautilus
      gnome-calculator
      evince
      loupe
      gnome-system-monitor
      kitty
      syncthing
      bleachbit
     ];
     shell = pkgs.zsh;
  };

  # Environment
  environment = {
    systemPackages = with pkgs; [
      wget
      nerd-fonts.jetbrains-mono
      git
      fzf
    ];

    gnome.excludePackages = with pkgs; [ 
      gnome-tour
      gnome-user-docs
      pkgs.gnome-shell-extensions
      gnome-backgrounds
    ];
  };

  # Services
  services = {
    xserver = {
      enable = true;
      xkb.layout = "gb";
      excludePackages = with pkgs; [ xterm ];
      displayManager.gdm.enable = true; # Display Manager: GDM
      desktopManager = {
        gnome = {
	  enable = true;
	  extraGSettingsOverrides = ''
	  [org.gnome.mutter] 
	  experimental-features=['scale-monitor-framebuffer', 'xwayland-native-scaling']
	  '';
        };
      }; # Desktop Manager: Gnome
    }; # Display Server: X11

    gnome = {
      core-apps.enable = false;
      core-developer-tools.enable = false;
      games.enable = false;
    };

    flatpak.enable = true;
  };

  # Virtualization/Containerization
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    }; # Container Manager: Podman
  };

  system.stateVersion = "25.05";
}
