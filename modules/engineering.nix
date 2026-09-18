{ pkgs, ... }:

{
	users.users.clay = {
		extraGroups = [
			"wireshark"
		];
	};

	programs.winbox.enable =true;
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
