return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim-tree" },
  },
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
  },
  init = function()
    -- Custom command for quick toggle - available immediately
    vim.api.nvim_create_user_command("TT", "NvimTreeToggle", {})
  end,
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    
    -- Auto-open nvim-tree on startup (disabled for now - was commented in original)
    local function open_nvim_tree()
      require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
    end
    vim.api.nvim_create_autocmd("VimEnter", { callback = open_nvim_tree })
  end,
}
