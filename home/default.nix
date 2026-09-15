{ config, pkgs, nixpkgs-unstable, ... }:

let
	pkgs-unstable = import nixpkgs-unstable {
		system = pkgs.stdenv.hostPlatform.system;
		config.allowUnfree = true;
};
in
{
	home.stateVersion = "25.11";
	home.packages = with pkgs; [
		# add user pkgs here
		pkgs-unstable.bitwarden-desktop
	];
	imports = [
		./gnome.nix
		./zsh.nix
	];
}
