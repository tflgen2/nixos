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
	users.users.jordan = {
		isNormalUser = true;
		description = "Joan-dee";
		initialPassword = "pass.123";
		shell = pkgs.zsh;
		
		extraGroups = [
			"networkmanager"
		];
	};
	users.users.evelyn = {
		isNormalUser = true;
		description = "Mim Mim";
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
	home-manager.users.larissa = import ../home;
	home-manager.users.evelyn = import ../home;
	home-manager.users.jordan = import ../home;
	home-manager.users.clayton = import ../home;
}
