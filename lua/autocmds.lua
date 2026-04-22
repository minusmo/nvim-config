require "nvchad.autocmds"

-- 디렉토리를 열 때 자동으로 nvim-tree 사이드바 열기
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local directory = vim.fn.isdirectory(data.file) == 1
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    if not directory and not no_name then
      return
    end

    if directory then
      vim.cmd.enew()
      vim.cmd.bw(data.buf)
      vim.cmd.cd(data.file)
    end

    require("nvim-tree.api").tree.open()
  end,
})
