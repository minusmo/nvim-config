vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
        autoImportCompletions = true,
        diagnosticSeverityOverrides = {
          reportMissingTypeStubs = "none",
        },
      },
    },
  },
})
vim.lsp.enable("basedpyright")
