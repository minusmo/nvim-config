return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      current_line_blame = false,
    },
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        html = { "prettier" },
      },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },
    keys = {
      {
        "<A-i>",
        function()
          require("toggleterm").toggle(3, nil, nil, "float")
        end,
        desc = "terminal toggle floating",
        mode = { "n", "t" },
      },
      {
        "<A-h>",
        function()
          require("toggleterm").toggle(1, 15, nil, "horizontal")
        end,
        desc = "terminal toggle horizontal",
        mode = { "n", "t" },
      },
      {
        "<A-v>",
        function()
          require("toggleterm").toggle(2, vim.o.columns * 0.4, nil, "vertical")
        end,
        desc = "terminal toggle vertical",
        mode = { "n", "t" },
      },
      {
        "<leader>h",
        "<cmd>ToggleTerm direction=horizontal<CR>",
        desc = "terminal new horizontal",
      },
      {
        "<leader>v",
        "<cmd>ToggleTerm direction=vertical<CR>",
        desc = "terminal new vertical",
      },
    },
    opts = {
      open_mapping = nil,
      shade_terminals = true,
      start_in_insert = true,
      persist_mode = true,
      direction = "horizontal",
      float_opts = { border = "curved" },
    },
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "comment toggle line" },
      { "gc", mode = { "n", "x" }, desc = "comment toggle" },
      { "gbc", mode = "n", desc = "comment toggle block" },
      { "gb", mode = { "n", "x" }, desc = "comment toggle block" },
    },
    opts = {},
  },
}
