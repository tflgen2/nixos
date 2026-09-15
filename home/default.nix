{ pkgs, ... }:

{
	home.stateVersion = "25.11";
	home.packages = with pkgs; [
		# add user pkgs here
	];
	imports = [
		./gnome.nix
		./zsh.nix
	];
}
