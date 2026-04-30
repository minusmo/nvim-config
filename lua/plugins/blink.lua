return {
    "saghen/blink.cmp",
    opts = {
        keymap = {
            -- super-tab preset: Tab/Shift-Tab으로 이동, Enter로 선택
            preset = "super-tab",
            -- 필요하다면 여기서 추가로 덮어쓰기 가능
            -- ['<CR>'] = { 'accept', 'fallback' },
            ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        },
    },
}
