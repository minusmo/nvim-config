local M = {}

M.lsp = function()
  if rawget(vim, "lsp") then
    local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
    local names = {}
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = buf })) do
      table.insert(names, client.name)
    end
    if #names > 0 then
      if vim.o.columns > 100 then
        return "%#St_Lsp#   LSP ~ " .. table.concat(names, ", ") .. " "
      else
        return "%#St_Lsp#   LSP "
      end
    end
  end
  return ""
end

return M
