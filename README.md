# nvim-no-nvchad

NvChad 없이 같은 기능을 구성한 개인 Neovim 설정. lazy.nvim 기반.

## 실행

```bash
# 기존 ~/.config/nvim 설정과 충돌 없이 별도 AppName 으로 실행
NVIM_APPNAME=nvim-no-nvchad nvim
```

이 디렉토리를 그대로 `~/.config/nvim-no-nvchad` 로 심볼릭 링크하거나, 이름 그대로 `~/.config/nvim` 으로 이동시키면 된다.

## 구성

| 영역 | 플러그인 |
|---|---|
| Colorscheme | sainnhe/everforest (light) |
| Statusline | nvim-lualine/lualine.nvim |
| Bufferline | akinsho/bufferline.nvim |
| Dashboard | goolord/alpha-nvim |
| File tree | nvim-tree.lua |
| Picker | nvim-telescope/telescope.nvim |
| Completion | saghen/blink.cmp + friendly-snippets |
| LSP | neovim/nvim-lspconfig + mason.nvim |
| Formatter | stevearc/conform.nvim (stylua, prettier) |
| Treesitter | nvim-treesitter |
| Git | lewis6991/gitsigns.nvim |
| Terminal | akinsho/toggleterm.nvim |
| Comment | numToStr/Comment.nvim |
| Outline | stevearc/aerial.nvim |
| Marks | ThePrimeagen/harpoon (harpoon2) |
| Markdown | OXY2DEV/markview.nvim |
| Autopairs | windwp/nvim-autopairs |
| Indent | indent-blankline.nvim |
| Keys | folke/which-key.nvim |

## 주요 키맵

Leader = `<Space>`

- `<C-n>` / `<leader>e` — nvim-tree toggle / focus, `:TT` 도 동일
- `<leader>ff` / `<leader>fa` — 파일 검색 (hidden/ignored 포함)
- `<leader>fw` — live grep
- `<leader>fb` / `<leader>fo` / `<leader>o` — 버퍼 / 최근 파일
- `<Tab>` / `<S-Tab>` — 버퍼 이동, `<leader>x` 닫기, `<leader>b` 새 버퍼
- `<leader>fm` — conform 포맷
- `<leader>ds` — diagnostic loclist
- `<leader>y` — aerial
- `<leader>a/l/1-4`, `<C-S-P/N>` — harpoon
- `<A-i>/<A-h>/<A-v>` — 플로팅/가로/세로 토글 터미널
- `<leader>h/v` — 새 가로/세로 터미널
- `<C-x>` — 터미널 normal 모드로
- `gd/gD/gi/gr/K/<leader>ra/<leader>ca/<leader>D/[d/]d` — LSP

## LSP 서버

`lua/configs/lsp/` 아래 파일별로 설정. 현재 활성: html, cssls, gopls, postgres_lsp, emmet_ls, pyright, lua_ls. 비활성(주석): basedpyright, ty.
