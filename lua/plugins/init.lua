return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                css = { "prettier" },
                html = { "prettier" },
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = "master",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc",
                "html", "css",
            },
        },
    },
}
