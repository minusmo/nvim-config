vim.lsp.config("cssls", {
  filetypes = { "css", "scss", "less" },
  settings = {
    css = { validate = true, lint = { unknownAtRules = "ignore" } },
    scss = { validate = true },
    less = { validate = true },
  },
})
vim.lsp.enable("cssls")
