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
          mason = false,
          enabled = false,
        },
        dexter = {
          mason = true,
          enabled = true,
        },
      },
    },
  },
}
