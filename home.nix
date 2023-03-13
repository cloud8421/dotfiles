{ pkgs, ... }: {
  home.username = "cloud";
  home.homeDirectory = "/Users/cloud";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.heroku
    (pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

  programs.git = {
    enable = true;
    userName = "Claudio Ortolina";
    userEmail = "cloud8421@gmail.com";

    aliases = {
      co = "checkout";
      pick = "cherry-pick";
      s = "status --short";
      pr = "pull --rebase";
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --";
    };

    ignores = [ ".DS_Store" ];
    attributes = [
      "*.c     diff=cpp"
      "*.h     diff=cpp"
      "*.c++   diff=cpp"
      "*.h++   diff=cpp"
      "*.cpp   diff=cpp"
      "*.hpp   diff=cpp"
      "*.cc    diff=cpp"
      "*.hh    diff=cpp"
      "*.cs    diff=csharp"
      "*.css   diff=css"
      "*.html  diff=html"
      "*.xhtml diff=html"
      "*.ex    diff=elixir"
      "*.exs   diff=elixir"
      "*.go    diff=golang"
      "*.php   diff=php"
      "*.pl    diff=perl"
      "*.py    diff=python"
      "*.md    diff=markdown"
      "*.rb    diff=ruby"
      "*.rake  diff=ruby"
      "*.rs    diff=rust"
      "*.lisp  diff=lisp"
      "*.el    diff=lisp"
      "*.clj   diff=lisp"
      "*.cljs  diff=lisp"
      "*.cljc  diff=lisp"
    ];

    extraConfig = {
      color.branch = "auto";
      color.diff = "auto";
      color.interactive = "auto";
      color.status = "auto";
      commit.verbose = "true";
      core.editor = "nvim";
      format.pretty = "%Cblue%h%Creset %Cgreen[%ar]%Creset (%an) %s";
      pull.rebase = "false";
      push.default = "current";
      status.branch = 1;
      status.short = 1;
    };

    lfs = {
      enable = true;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      vim-fugitive
      vim-nix
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          require('lualine').setup {
            options = {
              icons_enabled = false,
              theme = 'onedark',
              component_separators = '|',
              section_separators = ' ',
            }
          }
        '';
      }
    ];
  };

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
    };
  };

  programs.zsh = {
    enable = true;

    shellAliases = {
      s = "git status --short";
      l = "git lg";
      ll = "ls -ltr";
      ".." = "cd ..";
    };
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
