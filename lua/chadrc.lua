-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "everforest",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
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

        -- 파일명에서 확장자 추출 후 아이콘 매칭
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
    }
  }
--       tabufline = {
--          lazyload = false
--      }
}

return M
