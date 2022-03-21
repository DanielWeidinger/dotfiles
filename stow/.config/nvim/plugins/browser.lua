vim.g['open_url_default_mappings'] = 0 -- disable default mappings


local wk = require("which-key")

-- https://www.google.com/

wk.register({
    g = {
        B = {"<Plug>(open-url-browser)", "Open url under cursor"},
        G = {"<Plug>(open-url-search-google)", "Google search word under cursor"},
        W = {"<Plug>(open-url-search-wikipedia)", "Wiki search word under cursor"},
        -- ["<CR>"] = {"<Plug>(open-url-search)", ""}, -- duckduckgo
        -- S = {"<Plug>(open-url-search-so)", ""}, --stackoverflow
    },
})

wk.register({
    g = {
        B = {"<Plug>(open-url-browser)", "Open url selection"},
        G = {"<Plug>(open-url-search-google)", "Google search selection"},
        W = {"<Plug>(open-url-search-wikipedia)", "Wiki searc selection"},
        -- ["<CR>"] = {"<Plug>(open-url-search)", ""}, -- duckduckgo
        -- S = {"<Plug>(open-url-search-so)", ""}, --stackoverflow
    },
}, { mode="x" })
