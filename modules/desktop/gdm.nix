{ pkgs, lib, ... }:

{
	services.displayManager.gdm.enable = true;
	
	environment.systemPackages = with pkgs; [
		bibata-cursors
	];
	
	programs.dconf.profiles.gdm.databases = [
		{
			settings = {
				"org/gnome/desktop/interface" = {
					scaling-factor = lib.gvariant.mkInt32 1;
					color-scheme = "prefer-dark";
					accent-color = "teal";
					cursor-theme = "Bibata-Modern-Classic";
					cursor-size = lib.gvariant.mkInt32 24;
				};
			};
		}
	];
}
					
