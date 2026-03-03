return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {
          mason = false,
          enabled = false,
        },
        expert = {
          mason = true,
          enabled = true,
        },
      },
    },
  },
}
