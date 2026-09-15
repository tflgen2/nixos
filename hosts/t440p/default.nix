{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix

    #../../modules/desktop/gnome.nix
    #../../modules/development.nix
    #../../modules/virtualization.nix
    #../../modules/laptop.nix
  ];

  networking.hostName = "nix-440p";

  time.timeZone = "America/Indiana/Indianapolis";

  users.users.clay = {
    isNormalUser = true;
    description = "Clay Biela";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
    ];
    packages = with pkgs; [
      thunderbird
    ];
    shell = pkgs.zsh;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11";
}

