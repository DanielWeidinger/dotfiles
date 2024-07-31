vim.g["open_url_default_mappings"] = 0 -- disable default mappings

-- Normal mode mappings
vim.keymap.set("n", "gB", "<Plug>(open-url-browser)", { desc = "Open url under cursor" })
vim.keymap.set("n", "gG", "<Plug>(open-url-search-google)", { desc = "Google search word under cursor" })
vim.keymap.set("n", "gW", "<Plug>(open-url-search-wikipedia)", { desc = "Wiki search word under cursor" })
-- vim.keymap.set("n", "g<CR>", "<Plug>(open-url-search)", { desc = "DuckDuckGo search word under cursor" }) -- uncomment if needed
-- vim.keymap.set("n", "gS", "<Plug>(open-url-search-so)", { desc = "StackOverflow search word under cursor" }) -- uncomment if needed

-- Visual mode mappings
vim.keymap.set("x", "gB", "<Plug>(open-url-browser)", { desc = "Open url selection" })
vim.keymap.set("x", "gG", "<Plug>(open-url-search-google)", { desc = "Google search selection" })
vim.keymap.set("x", "gW", "<Plug>(open-url-search-wikipedia)", { desc = "Wiki search selection" })
-- vim.keymap.set("x", "g<CR>", "<Plug>(open-url-search)", { desc = "DuckDuckGo search selection" }) -- uncomment if needed
-- vim.keymap.set("x", "gS", "<Plug>(open-url-search-so)", { desc = "StackOverflow search selection" }) -- uncomment if needed
