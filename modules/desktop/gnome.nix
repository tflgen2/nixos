{ pkgs, ... }:

{
  imports = [
	./gdm.nix
  ];

  nixpkgs.config.allowUnfree = true;
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    baobab
    decibels
    epiphany
    evince
    geary
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-connections
    gnome-contacts
    gnome-font-viewer
    gnome-maps
    gnome-music
    gnome-system-monitor
    gnome-text-editor
    gnome-tour
    loupe
    simple-scan
    snapshot
    totem
    yelp
  ];
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    nautilus
    gnome-console
    bibata-cursors
    google-chrome
  ];
}
