{ pkgs, ... }:

{
	time.timeZone = "America/Indiana/Indianapolis";
	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
	];

}
	
