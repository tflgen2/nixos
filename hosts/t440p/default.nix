{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix

    ../../modules/fonts.nix
    ../../modules/users.nix
    #../../modules/desktop/gnome.nix
    #../../modules/development.nix
    #../../modules/virtualization.nix
    #../../modules/laptop.nix
  ];


  time.timeZone = "America/Indiana/Indianapolis";

  users.users.clay = {
    extraGroups = [
      "libvirtd"
    ];
    packages = with pkgs; [
      thunderbird
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11";
}

