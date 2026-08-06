-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.listchars = "eol:↵,trail:~,tab:>-,nbsp:␣"

vim.lsp.config("expert", {
  cmd = { "expert" },
  root_markers = { "mix.exs", ".git" },
  filetypes = { "elixir", "eelixir", "heex", "surface" },
  settings = {
    expert = {
      enableDiagnostics = true,
      enableFormatting = true,
    },
  },
})

vim.lsp.enable("expert")
