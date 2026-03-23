require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set('n', '<C-a>', '<C-^>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>o', '<cmd>Telescope oldfiles<CR>', { noremap = true, silent = true })
