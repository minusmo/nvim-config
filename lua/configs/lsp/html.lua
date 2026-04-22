vim.lsp.config("html", {
  filetypes = { "html", "templ" },
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
  },
})
vim.lsp.enable("html")
