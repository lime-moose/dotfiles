####### LIME-MOOSE NIXOS CONFIGURATION ######

{ config, lib, pkgs, ... }:

{
  imports = [./hardware-configuration.nix]; # Include the results of the hardware scan.

  #### Use the systemd-boot EFI boot loader ####
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #### Use latest kernel ####
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #### Networking ####
  networking.hostName = "io"; # Hostname
  networking.networkmanager.enable = true;  # Enable NetworkManager

  #### Time Zone ####
  time.timeZone = "Asia/Kolkata";

  #### Locale ####
  i18n.defaultLocale = "en_GB.UTF-8";

  #### User Account ####
  programs.zsh.enable = true; # Enable zsh

  users.users.ikrsh = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Group(s)
     packages = with pkgs; [
       distrobox
       nautilus
       gnome-calculator
       loupe
       gnome-system-monitor
       kitty
       syncthing
     ];
     shell = pkgs.zsh; # Default shell
   };

 users.users.gdm = {
    isSystemUser = true;
    shell = "/bin/sh";
  };

  #### List packages installed in system profile ####
  environment.systemPackages = with pkgs; [
     wget
     nerd-fonts.jetbrains-mono
     git
     fzf
   ];

  ##### List services to enable ####

  ## Enable Gnome
  services.xserver.enable = true; 	# Enable X11
  services.xserver.xkb.layout = "gb";	# Keymap in X11
  services.xserver.excludePackages = with pkgs; [ xterm ]; # Exclude some X11 applications
  services.xserver.displayManager.gdm.enable = true; # Enable GDM
  services.xserver.desktopManager.gnome.enable = true; # Enable Gnome
  # Disable Gnome Application Suite
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  
  ## Enable Flatpak
  services.flatpak.enable = true; 

  #### Environments ####
  environment.gnome.excludePackages = with pkgs; [ 
     gnome-tour 
     gnome-user-docs
     pkgs.gnome-shell-extensions
     gnome-backgrounds
  ]; # Exclude some gnome system applications

  #### Virtualization/Containerization ####
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
