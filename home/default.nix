{ pkgs, ... }:

{
	home.stateVersion = "25.11";
	imports = [
		./gnome.nix
		./zsh.nix
#		./applications.nix
	];
}
