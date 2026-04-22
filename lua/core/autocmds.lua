local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "*",
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

autocmd("VimEnter", {
  callback = function(data)
    if vim.fn.isdirectory(data.file) ~= 1 then
      return
    end

    vim.cmd.cd(data.file)

    vim.schedule(function()
      local ok, api = pcall(require, "nvim-tree.api")
      if ok then
        api.tree.open()
      end
      if vim.api.nvim_buf_is_valid(data.buf) then
        pcall(vim.api.nvim_buf_delete, data.buf, { force = true })
      end
    end)
  end,
})

autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})
