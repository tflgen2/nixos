{ pkgs, ... }:

{
	users.users.clayton = {
		isNormalUser = true;
		description = "Buddy";
		initialPassword = "pass.123";
		shell = pkgs.zsh;
		
		extraGroups = [
			"networkmanager"
		];
	};
	users.users.larissa = {
		isNormalUser = true;
		description = "Pretty Lady";
		initialPassword = "pass.123";
		shell = pkgs.zsh;
		
		extraGroups = [
			"networkmanager"
		];
	};
}
