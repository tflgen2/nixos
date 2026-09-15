
{ config, pkgs, ... }:

{
  boot = {
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
    loader.timeout = 10;
    extraModprobeConfig = ''
      options thinkpad_acpi force-load=1 fan_control=1
    '';
    blacklistedKernelModules = [
      "mei_me"
      "mei"
    ];
  };
  hardware.trackpoint = {
    enable = true;
    emulateWheel = true;
  };
  hardware.cpu.intel.updateMicrocode = true;
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "zbookSlim"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall.trustedInterfaces = [ "virbr0" ];


  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  #programs.hyprland = {
    #enable = true;
    #withUWSM = true;
    #xwayland.enable = true;
  #};

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  #users.users.clay = {
    #isNormalUser = true;
    #description = "Clay Biela";
    #extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    #packages = with pkgs; [
      #thunderbird
    #];
  #};

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    wget
    dnsmasq
    neofetch
    htop
    ncdu
    vlc
    gnome-tweaks
    kitty
    wofi
    remmina
    rtorrent
    qbittorrent
    git
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  programs.winbox.enable = true;
  programs.zsh.enable = true;
  programs.steam = {
    enable = true;
  };
  programs.gamemode.enable = true;

  system.stateVersion = "25.11"; 

  nixpkgs.config.allowUnfree = true;
  
  fonts.packages = with pkgs; [
	nerd-fonts.meslo-lg
  ];


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
