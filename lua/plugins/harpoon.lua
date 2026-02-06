return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>a", function() require("harpoon"):list():add() end, desc = "Add harpoon entry" },
    { "<leader>l", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Open harpoon list" },
    { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon file 1" },
    { "<C-t>", function() require("harpoon"):list():select(2) end, desc = "Harpoon file 2" },
    { "<C-n>", function() require("harpoon"):list():select(3) end, desc = "Harpoon file 3" },
    { "<C-s>", function() require("harpoon"):list():select(4) end, desc = "Harpoon file 4" },
    { "<C-S-P>", function() require("harpoon"):list():prev() end, desc = "Harpoon previous" },
    { "<C-S-N>", function() require("harpoon"):list():next() end, desc = "Harpoon next" },
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
  end,
}