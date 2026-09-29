
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
    kernelPackages = pkgs.linuxPackages_latest;
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

  environment.etc."xdg/monitors.xml".source = ./gdm-monitors.xml;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "t440p";



  system.stateVersion = "25.11"; 

}
