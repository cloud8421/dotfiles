return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  config = function()
    require("orgmode").setup({
      org_agenda_files = "~/Dropbox/org/**/*",
      org_default_notes_file = "~/Dropbox/org/refile.org",
      org_todo_keywords = { "TODO(t)", "|", "CANCELED(c)", "DONE(d)" },
      org_startup_folded = "content",
      org_capture_templates = {
        j = {
          description = "Personal",
          template = "* %U\n%?",
          target = "~/Dropbox/org/Journal/journal.org",
          datetree = { tree_type = "day" },
        },
      },
    })
    -- Experimental LSP support
    vim.lsp.enable("org")
  end,
}
