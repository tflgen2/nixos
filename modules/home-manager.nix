{ home-manager, nixpkgs-unstable, ... }:

{
	imports = [
		home-manager.nixosModules.home-manager
	];
	
	home-manager = {
		useGlobalPkgs = true;
		useUserPkgs = true;

		extraSpecialArgs = {
			inherit nixpkgs-unstable;
		};

		users.clay = import ../home;
	};
}
	
