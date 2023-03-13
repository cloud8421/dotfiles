{ pkgs, ... }: {
  home.username = "cloud";
  home.homeDirectory = "/Users/cloud";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
  
  home.packages = [
    pkgs.git
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
    };
  };

  programs.zsh = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "a";
    baseIndex = 1;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      pain-control
      copycat
      yank
      open
      battery
      prefix-highlight
      {
        plugin = dracula;
	extraConfig = ''
          set -g @dracula-show-fahrenheit false
          set -g @dracula-show-battery false
          set -g @dracula-show-network false
          set -g @dracula-show-weather false
	'';
      }
    ];

    extraConfig = ''
      # Cycle through panes
      unbind ^A
      bind ^A select-pane -t :.+
      # Copy mode works as Vim
      unbind [
      bind Escape copy-mode
      unbind p
      bind p paste-buffer

      # Renumber windows when adding a new one
      set -g renumber-windows on

      # Mouse support
      set -g mouse on
    '';
  };

}
