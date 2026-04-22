return {
  "stevearc/aerial.nvim",
  event = "LspAttach",
  cmd = { "AerialToggle", "AerialOpen", "AerialClose", "AerialNavToggle" },
  keys = {
    { "<leader>y", "<cmd>AerialToggle right<CR>", desc = "Aerial toggle" },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
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
  },
}
