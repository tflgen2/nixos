{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix

    ../../modules/home-manager.nix
    ../../modules/common.nix
    ../../modules/fonts.nix
    ../../modules/users.nix
    ../../modules/homeUsers.nix
    ../../modules/desktop/gnome.nix
    ../../modules/gaming.nix
    ../../modules/engineering.nix
    ../../modules/virtualization.nix
    #../../modules/laptop.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11";
}

