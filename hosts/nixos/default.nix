{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ../../modules/common.nix
    ../../modules/home-manager.nix
    ../../modules/fonts.nix
    ../../modules/users.nix

    ../../modules/desktop/gnome.nix
    ../../modules/engineering.nix
    #../../modules/laptop.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11";
}

