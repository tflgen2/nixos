{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      share = true;
    };

    shellAliases = {
      ll = "ls -lh";
      la = "ls -lah";
      grep = "grep --color=auto";
    };

    initContent = ''
      # Manjaro-style key bindings
      bindkey -e

      # Ctrl+Left / Ctrl+Right
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word

      # Home / End
      bindkey "^[[H" beginning-of-line
      bindkey "^[[F" end-of-line
    '';
  };

  programs.zsh.plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
  ];
}
