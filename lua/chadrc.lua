---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gruvbox",
  statusline = {
    theme = "minimal",
    separator_style = "default",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      file = function()
        local path = vim.fn.expand "%:~:."
        if path == "" then
          return "%#StText# 󰈚 Empty "
        end

        local filename = vim.fn.expand "%:t"
        local ext = vim.fn.expand "%:e"
        local devicons_ok, devicons = pcall(require, "nvim-web-devicons")

        local icon = "󰈚 "
        if devicons_ok then
          local ft_icon = devicons.get_icon(filename, ext)
          if ft_icon then
            icon = ft_icon .. " "
          end
        end

        return "%#StText# " .. icon .. path .. " "
      end,
      lsp = function()
        return require("configs.statusline").lsp()
      end,
    },
  },
}

return M
