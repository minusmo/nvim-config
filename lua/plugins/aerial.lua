return {
  {
    "stevearc/aerial.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup({
        backends = { "lsp", "treesitter" },
        layout = {
          default_direction = "right",
          min_width = 30,
        },
        filter_kind = {
          "Class",
          "Function",
          "Method",
          "Module",
        },
      })

      vim.keymap.set("n", "<leader>y", "<cmd>AerialToggle right<CR>", { silent = true })
    end,
  },
}
