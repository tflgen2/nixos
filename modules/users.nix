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
}
