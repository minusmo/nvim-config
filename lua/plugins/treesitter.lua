return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUpdate", "TSUpdateSync" },

        -- main 브랜치에서는 configs.setup이 없어졌으므로 opts/config 분리 대신 직접 setup 호출
        config = function()
            -- 파서 설치 위치 (원하면 커스터마이즈 가능)
            local ts = require("nvim-treesitter")
            ts.setup({
                -- parsers 설치 설정
                ensure_installed = {
                    "vim",
                    "vimdoc",
                    "lua",
                    "luadoc",
                    "html",
                    "css",
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "go",
                    "python",
                    "sql",
                    "json",
                    "yaml",
                    "toml",
                },
                -- 필요시 auto_install 등 새 옵션 추가
                auto_install = true,
            })

            -- 하이라이트/인덴트는 vim.treesitter API 쪽으로 이동
            -- 전체 버퍼에 대해 자동으로 treesitter를 켜는 예시
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("treesitter-main", { clear = true }),
                pattern = "*",
                callback = function(args)
                    -- pcall로 감싸서 파서 없는 경우에도 에러 없이 넘어가게
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
    },
}