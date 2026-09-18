
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
    ];
    loader = {
	timeout = 10;
	grub = {
		enable = true;
		device = "/dev/sda";
		useOSProber = true;
	};
    };
    
    kernelPackages = pkgs.linuxPackages_latest;

    #extraModprobeConfig = ''
      #options thinkpad_acpi force-load=1 fan_control=1
    #'';
    #blacklistedKernelModules = [
      #"mei_me"
      #"mei"
    #];
  };
  hardware.trackpoint = {
    enable = true;
    emulateWheel = true;
  };
  hardware.cpu.intel.updateMicrocode = true;


  networking.hostName = "t520";

  services.printing = {
	enable = true;
	drivers = [
		pkgs.brlaser
		pkgs.brgenml1lpr
		pkgs.brgenml1cupswrapper
	];
  };


  system.stateVersion = "25.11"; 

}
