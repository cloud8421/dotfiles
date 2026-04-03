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
          enabled = true,
        },
      },
    },
  },
}
