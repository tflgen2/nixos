{ config, pkgs, lib, ... }:


{ 
  home.packages = with pkgs; [
    papirus-icon-theme
    gnome-tweaks
    bibata-cursors

    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator

  ];
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
  };

  dconf.settings = {
    "org/gnome/Console" = {
      use-system-font = false;
      custom-font = "MesloLGS Nerd Font 11';
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      accent-color = "red";
      icon-theme = "Papirus-Dark";
      cursor-theme = "Bibata-Modern-Classic";
      cursor-size = 24;
      enable-animations = true;
    };
    "org/gnome/desktop/wm/keybindings" = {
	    switch-to-workspace-1 = [ "<Super>1" ];
	    switch-to-workspace-2 = [ "<Super>2" ];
	    switch-to-workspace-3 = [ "<Super>3" ];
	    switch-to-workspace-4 = [ "<Super>4" ];
	    switch-to-workspace-5 = [ "<Super>5" ];
	    switch-to-workspace-6 = [ "<Super>6" ];
	    switch-to-workspace-7 = [ "<Super>7" ];
	    switch-to-workspace-8 = [ "<Super>8" ];

	    move-to-workspace-1 = [ "<Super><Shift>1" ];
	    move-to-workspace-2 = [ "<Super><Shift>2" ];
	    move-to-workspace-3 = [ "<Super><Shift>3" ];
	    move-to-workspace-4 = [ "<Super><Shift>4" ];
	    move-to-workspace-5 = [ "<Super><Shift>5" ];
	    move-to-workspace-6 = [ "<Super><Shift>6" ];
	    move-to-workspace-7 = [ "<Super><Shift>7" ];
	    move-to-workspace-8 = [ "<Super><Shift>8" ];
	    num-workspaces = 8;
    };
    "org/gnome/desktop/wm/preferences" = {
	    button-layout = "appmenu:minimize,maximize,close";
	    num-workspaces = 4;
    };
    "org/gnome/mutter" = {
	dynamic-workspaces = true;
    };
    "org/gnome/shell/keybindings" = {

	    switch-to-application-1 = [ ];
	    switch-to-application-2 = [ ];
	    switch-to-application-3 = [ ];
	    switch-to-application-4 = [ ];
	    switch-to-application-5 = [ ];
	    switch-to-application-6 = [ ];
	    switch-to-application-7 = [ ];
	    switch-to-application-8 = [ ];
	    switch-to-application-9 = [ ];
    };

    "org/gnome/shell" = {
	disable-user-extensions = false;
	enabled-extensions = [
		"dash-to-dock@micxgx.gmail.com"
		"appindicatorsupport@rgcjonas.gmail.com"
	];
	favorite-apps = [
	  "nixos-manual.desktop"
	  "org.gnome.Nautilus.desktop"
	  "org.gnome.Console.desktop"
	  "firefox.desktop"
	  "winbox.desktop"
	  "thunderbird.desktop"
	];
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
	dock-position = "BOTTOM";
	extend-height = false;

	dock-fixed = false;
	autohide = true;
	intellihide = true;

	dash-max-icon-size = 48;
	icon-size-fixed = false;

	transparancy-mode = "DYNAMIC";
	background-opacity = 0.8;

	show-apps-at-top = false;
	show-trash = false;
	show-mounts = true;

	click-action = "focus-minimize-or-previews";
	scroll-action = "cycle-windows";
	running-indicator-style = "DOTS";
	custom-theme-shrink = true;
	hot-keys = false;
    };
  };
}
  
