return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall" },
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("configs.lsp.html")
      require("configs.lsp.cssls")
      require("configs.lsp.gopls")
      require("configs.lsp.postgres_lsp")
      require("configs.lsp.emmet_ls")
      require("configs.lsp.pyright")
      -- require("configs.lsp.ty")
      -- require("configs.lsp.basedpyright")
    end,
  },
}
