{ pkgs, ... }:

{
	users.users.clay = {
		extraGroups = [
			"wireshark"
		];
	};

	programs.wireshark = {
		enable =true;
		package =pkgs.wireshark;
		dumpcap.enable =true;
		usbmon.enable =true;
	};
	environment.systemPackages = with pkgs; [
		dnsmasq
	];
}
