{ pkgs, ... }:

{
	users.users.clay = {
		isNormalUser = true;
		description = "Clay Biela";
		shell = pkgs.zsh;
		
		extraGroups = [
			"wheel"
			"networkmanager"
		];
	};
	home-manager.users.clay = import ../home;
	home-manager.users.gdm = { lib, ... }: {
		home.stateVersion = "25.11";
		dconf.settings = {
			"org/gnome/desktop/interface" = {
				scaling-factor = lib.hm.gvariant.mkUint32 1;
			};
		};
	};

}
