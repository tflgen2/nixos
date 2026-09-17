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
    {
      nixosConfigurations = {
	t440p = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			modules = [
				./hosts/t440p

				#nixos-hardware.nixosModules.lenovo-thinkpad-t440p
				home-manager.nixosModules.home-manager

				{
				  home-manager.useGlobalPkgs = true;
				  home-manager.useUserPackages = true;
				  home-manager.users.clay = import ./home;
				  home-manager.extraSpecialArgs = {
				      inherit nixpkgs-unstable;
				  };
				}
			];
	        };
	t520 = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			modules = [
				./hosts/t520

				#nixos-hardware.nixosModules.lenovo-thinkpad-t440p
				home-manager.nixosModules.home-manager

				{
				  home-manager.useGlobalPkgs = true;
				  home-manager.useUserPackages = true;
				  home-manager.users.clay = import ./home;
				  home-manager.extraSpecialArgs = {
				      inherit nixpkgs-unstable;
				  };
				}
			];
	        };
	zbookSlim = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			modules = [
				./hosts/zbookSlim

				home-manager.nixosModules.home-manager

				{
				  home-manager.useGlobalPkgs = true;
				  home-manager.useUserPackages = true;
				  home-manager.users.clay = import ./home;
				  home-manager.extraSpecialArgs = {
				      inherit nixpkgs-unstable;
				  };
				}
			];
	        };
     };
    };
}

