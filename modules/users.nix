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
}
