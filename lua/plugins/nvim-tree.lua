return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen", "NvimTreeClose" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sort = { sorter = "case_sensitive" },
    renderer = { group_empty = true },
    view = { width = 30 },
    filters = { dotfiles = false },
  },
  init = function()
    vim.api.nvim_create_user_command("TT", "NvimTreeToggle", {})
  end,
}
