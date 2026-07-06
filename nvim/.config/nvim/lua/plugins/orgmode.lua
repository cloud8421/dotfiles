return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  config = function()
    require("orgmode").setup({
      org_agenda_files = "~/Dropbox/org/**/*",
      org_default_notes_file = "~/Dropbox/org/refile.org",
    })
    -- Experimental LSP support
    vim.lsp.enable("org")
  end,
}
