local wk = require("which-key")

wk.register({
	["<C-q>"] = { ":call ToggleQFList(1)<CR>", "quickfix" },
})

wk.register({
	s = { ":so ~/.config/nvim/init.vim<cr>", "source" },
	e = { ":NvimTreeToggle<cr>", "explorer" },
	m = { ":MaximizerToggle!<cr>", "maximize" },
	q = { ":call ToggleQFList(0)<CR>", "local qfl" },
	["p"] = "which_key_ignore", -- special label to hide it in the popup
	["P"] = "which_key_ignore", -- special label to hide it in the popup
	["<space>"] = "which_key_ignore", -- special label to hide it in the popup
	["y"] = "which_key_ignore", -- special label to hide it in the popup
	["Y"] = "which_key_ignore", -- special label to hide it in the popup
}, {
	prefix = "<leader>",
})

-- spelling
wk.register({
	z = {
		name = "Text and spelling",
		t = { ":setlocal spell!<cr>", "local spelling" },
	},
}, {
	prefix = "<leader>",
})

wk.setup()
