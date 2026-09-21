{ pkgs, nixpkgs-unstable, config, ... }:

let
	pkgs-unstable = import nixpkgs-unstable {
		system = pkgs.stdenv.hostPlatform.system;
		config.allowUnfree = true;
};
in
{
	home.packages = with pkgs; [
		vlc
		kitty
		remmina
		rtorrent
		tree
		qbittorrent
		pkgs-unstable.bitwarden-desktop
		pkgs-unstable.winbox4

	];
}
