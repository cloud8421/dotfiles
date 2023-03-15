{ pkgs, ... }: {
  home.username = "cloud";
  home.homeDirectory = "/Users/cloud";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.heroku
    pkgs.postgresql
    pkgs.fzf
    (pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

  programs.git = {
    enable = true;
    userName = "Claudio Ortolina";
    userEmail = "claudio@pspdfkit.com";

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
      core.sshCommand = "ssh";
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBKfDkGJ+DUvKFUnZM+Snku6dTa61C0lVbchW82DjF3c";
      gpg = {
        "ssh" = {
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };
      };

      color.branch = "auto";
      color.diff = "auto";
      color.interactive = "auto";
      color.status = "auto";
      commit.verbose = true;
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
      vim-surround
      onedarkpro-nvim
      tabular
      vim-test
      vimux
      telescope-fzf-native-nvim

      {
        plugin = comment-nvim;
        type = "lua";
        config = ''
          require('Comment').setup({
            toggler = {
                line = '<leader>cc',
                block = '<leader>bc',
            },
            opleader = {
                line = '<leader>c',
                block = '<leader>b',
            },
          })
        '';
      }

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

      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          require('telescope').setup {
            defaults = {
              mappings = {
                i = {
                  ['<C-u>'] = false,
                  ['<C-d>'] = false,
                },
              },
            },
           extensions = {
              fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                 -- the default case_mode is "smart_case"
              }
            }
          }

          require('telescope').load_extension('fzf')

          vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
          vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
          vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
        '';
      }


      {
        plugin = telescope-file-browser-nvim;
        type = "lua";
        config = ''
          -- To get telescope-file-browser loaded and working with telescope,
          -- you need to call load_extension, somewhere after setup function:
          require("telescope").load_extension "file_browser"

          vim.keymap.set('n', '<leader>fb', ":Telescope file_browser<cr>")
          vim.keymap.set('n', '<leader>fB', ":Telescope file_browser path=%:p:h<cr>")
        '';
      }

      {
        plugin = vim-startify;
        type = "viml";
        config = ''
          let g:startify_change_to_dir = 0
          let g:startify_list_order = ['dir', 'sessions']
        '';
      }

      {
        plugin = vim-better-whitespace;
        type = "viml";
        config = ''
          set list listchars=tab:»·,trail:·
        '';
      }
    ];

    extraLuaConfig = ''
      vim.g.mapleader = ','
      vim.g.maplocalleader = ','
      -- Show proper colors in terminal
      vim.o.termguicolors = true
      vim.cmd.colorscheme 'onedark'
      -- Share clipboard with MacOS
      vim.o.clipboard = 'unnamed'
      -- Set highlight on search
      vim.o.hlsearch = false
      -- Make line numbers default
      vim.wo.number = true
      -- Enable mouse mode
      vim.o.mouse = 'a'
      -- Case insensitive searching UNLESS /C or capital in search
      vim.o.ignorecase = true
      vim.o.smartcase = true
      -- Decrease update time
      vim.o.updatetime = 250
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      -- Set completeopt to have a better completion experience
      vim.o.completeopt = 'menuone,noselect'

      -- Testing
      vim.g.VimuxOrientation = "v"
      vim.g.VimuxHeight = "30"
      vim.g.VimuxUseNearestPane = 1
      vim.g['test#strategy'] = "neovim"

      vim.keymap.set('n', '<leader>tf', ":TestNearest<cr>")
      vim.keymap.set('n', '<leader>tt', ":TestFile<cr>")
      vim.keymap.set('n', '<leader>tl', ":TestLast<cr>")

      if os.getenv("TMUX") then
        vim.g['test#strategy'] = "vimux"
      end
    '';

  };

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
    };
  };

  programs.ssh = {
    enable = true;

    matchBlocks = {
      "mac-mini" = {
        host = "mac-mini.local";
        user = "cloud";
      };
    };

    extraConfig = ''
      IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      AddKeysToAgent yes
    '';
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
