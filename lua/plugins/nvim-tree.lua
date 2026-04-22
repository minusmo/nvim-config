return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    sort = { sorter = "case_sensitive" },
    renderer = { group_empty = true },
  },
  init = function()
    vim.api.nvim_create_user_command("TT", "NvimTreeToggle", {})
  end,
}
