require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<C-a>", "<C-^>", { noremap = true, silent = true, desc = "Switch to alternate file" })
map("n", "<leader>o", "<cmd>Telescope oldfiles<CR>", { noremap = true, silent = true, desc = "Open recent files" })
