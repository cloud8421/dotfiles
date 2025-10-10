return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      -- Shim expert if missing
      if not configs.expert then
        configs.expert = {
          default_config = {
            cmd = { "/Users/cloud/Tools/expert" },
            filetypes = { "elixir", "eelixir", "heex" },
            root_dir = lspconfig.util.root_pattern("mix.exs", ".git"),
            single_file_support = true,
          },
          docs = {
            description = [[
https://github.com/elixir-expert/expert
Expert is the official language server implementation for the Elixir programming language.
]],
          },
        }
      end

      -- Enable it through LazyVim's opts.servers
      opts.servers = opts.servers or {}
      opts.servers.expert = {}
      opts.servers.elixirls = {
        mason = false,
        enabled = false,
      }
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "expert",
      })
    end,
  },
}
