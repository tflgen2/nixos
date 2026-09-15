{ config, pkgs, lib, ... }:


{ 
  home.packages = with pkgs; [
    papirus-icon-theme
    gnome-tweaks
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
  };
}
  
