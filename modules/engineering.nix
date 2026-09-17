{ pkgs, ... }:

{
	programs.winbox.enable =true;
	environment.systemPackages = with pkgs; [
		dnsmasq
		tcpdump
		wireshark
	];
}
