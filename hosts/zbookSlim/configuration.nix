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
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];

    loader = {
	timeout = 10;
	systemd-boot.enable = true;
	efi.canTouchEfiVariables = true;
    };
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



  networking.hostName = "zbookSlim";
  system.stateVersion = "25.11"; 

}
