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
	home-manager.users.clay = {
		imports = [
			../home
			../home/applications.nix
		];
	};
}
