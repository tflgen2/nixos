{ nixpkgs-unstable, ... }:

{
	
	home-manager = {
		useGlobalPkgs = true;
		useUserPackages= true;

		extraSpecialArgs = {
			inherit nixpkgs-unstable;
		};
		

	};
}
	
