{
  description = "Clay's NixOS workstation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
      let
	mkHost = host: nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = {
			inherit nixpkgs-unstable ;
		};
		
		modules = [
			./hosts/${host}
			home-manager.nixosModules.home-manager
		];
	};
      in
      {
      nixosConfigurations = {
	nixos = mkHost "nixos";
	t440p = mkHost "t440p";
	t520 = mkHost "t520";
	zbookSlim = mkHost "zbookSlim";

     };
    };
}

