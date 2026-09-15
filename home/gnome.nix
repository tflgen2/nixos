{ config, pkgs, lib, ... }:


{ 
  home.packages = with pkgs; [
    papirus-icon-theme
    gnome-tweaks
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator

  ];
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      accent-color = "red";
      icon-theme = "Papirus-Dark";
      cursor-theme = "Adwaita";
      enable-animations = true;
    };
    "org/gnome/desktop/wm/preferences" = {
	    button-layout = "appmenu:minimize,maximize,close";
	    num-workspaces = 4;
    };
    "org/gnome/mutter" = {
	dynamic-workspaces = true;
    };
    "org/gnome/shell" = {
	disable-user-extensions = false;
	enabled-extensions = [
		"dash-to-dock@micxgx.gmail.com"
		"appindicatorsupport@rgcjonas.gmail.com"
	];
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
	dock-position = "BOTTOM";
	extend-height = false;
	dock-fixed = false;
	autohide = true;
	intellihide = true;
	show-apps-at-top = false;
	show-trash = false;
	show-mounts = true;
	click-action = "focus-minimize-or-previews";
	running-indicator-style = "DOTS";
	custom-theme-shrink = true;
    };
  };
}
  
