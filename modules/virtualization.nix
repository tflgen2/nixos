{ pkgs, ... }:

{
	users.users.clay = {
		extraGroups = [
			"libvirtd"
		];
	};

	virtualisation.libvirtd.enable = true;
	virtualisation.spiceUSBRedirection.enable = true;
	programs.virt-manager.enable = true;

	networking.firewall.trustedInterfaces = [ "virbr0" ];
	environment.systemPackages = with pkgs; [
		spice-gtk
		spice-protocol
	];


}

