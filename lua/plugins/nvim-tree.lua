return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
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
    local function open_nvim_tree(data)
      local real_file = vim.fn.filereadable(data.file) == 1
      local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
      local directory = vim.fn.isdirectory(data.file) == 1

      if real_file then
        return
      end

      if directory then
        vim.cmd.enew()
        vim.cmd.bw(data.buf)
        vim.cmd.cd(data.file)
      elseif not no_name then
        return
      end

      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd("VimEnter", { callback = open_nvim_tree })
  end,
}
