{ config, pkgs, lib, ... }:

let 
  accent = "teal";

  papirusAccentMap = {
	blue = "blue";
	teal = "darkcyan";
	green = "green";
	yellow = "yellow";
	orange = "deeporange";
	red = "red";
	pink = "pink";
	purple = "magenta";
	slate = "bluegrey";
  };

  folderColor = papirusAccentMap.${accent};
in
{ 
  ##configuration to support accent color from manjaro
  #xdg.configFile."gtk-4.0/gtk.css".text = ''
    #:root {
      #--accent-bg-color: #16a085;
    #}
  #'';
  #xdg.configFile."gtk-3.0/gtk.css".text = ''
    #@define-color accent_color #16a085;
    #@define-color accent_bg_color #16a085;
    #@define-color theme_selected_bg_color #16a085;
  #'';
#
  home.activation.installPapirusThemes =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      export PATH="${lib.makeBinPath [
	pkgs.coreutils
	pkgs.gawk
      ]}:$PATH"

      PAPIRUS="${pkgs.papirus-icon-theme}/share/icons"
      LOCAL="$HOME/.local/share/icons"
      MARKER="$LOCAL/.papirus-nix-source"

      mkdir -p "$LOCAL"

      CURRENT_SOURCE=""
      if [ -f "$MARKER" ]; then
        CURRENT_SOURCE="$(cat "$MARKER")"
      fi

      if [ "$CURRENT_SOURCE" != "${pkgs.papirus-icon-theme}" ]; then
        rm -rf \
          "$LOCAL/Papirus" \
          "$LOCAL/Papirus-Dark" \
          "$LOCAL/Papirus-Light"

        cp -a "$PAPIRUS/Papirus" "$LOCAL/"
        cp -a "$PAPIRUS/Papirus-Dark" "$LOCAL/"
        cp -a "$PAPIRUS/Papirus-Light" "$LOCAL/"

        chmod -R u+w \
          "$LOCAL/Papirus" \
          "$LOCAL/Papirus-Dark" \
          "$LOCAL/Papirus-Light"

        printf '%s\n' "${pkgs.papirus-icon-theme}" > "$MARKER"
      fi

      ${pkgs.papirus-folders}/bin/papirus-folders \
        -C ${folderColor} \
        --theme Papirus-Dark
    '';

  home.packages = with pkgs; [
    papirus-icon-theme
    papirus-folders
    gnome-tweaks
    bibata-cursors
    adw-gtk3

    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.launch-new-instance
	

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
      custom-font = "MesloLGS Nerd Font 11";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      accent-color = accent;
      icon-theme = "Papirus-Dark";
      cursor-theme = "Bibata-Modern-Classic";
      cursor-size = 24;
      enable-animations = true;
      gtk-theme = "adw-gtk3-dark";
      font-name = "Noto Sans 11";
      document-font-name = "Sans 11";
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
		"papirus-folders-colorizer@NiffirgkaJ.github.com"
		"launch-new-instance@gnome-shell-extensions.gcampax.github.com"
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

	isolate-workspace = true;
	click-action = "launch";
	scroll-action = "cycle-windows";
	running-indicator-style = "DOTS";
	custom-theme-shrink = true;
	hot-keys = false;
    };
  };
}
  
