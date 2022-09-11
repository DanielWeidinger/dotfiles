local wk = require("which-key")

wk.register({
	["<C-q>"] = { ":call ToggleQFList(1)<CR>", "quickfix" },
})

wk.register({
	s = { ":so ~/.config/nvim/init.lua<cr>", "source" },
	e = { ":NvimTreeToggle<cr>", "explorer" },
	m = { ":MaximizerToggle!<cr>", "maximize" },
	q = { ":call ToggleQFList(0)<CR>", "local qfl" },
	u = { ":UndotreeToggle<CR>", "Open UndoTree helper" },
	["-"] = { ":call ToggleMouseMode()<CR>", "local qfl" },
	["p"] = "which_key_ignore", -- special label to hide it in the popup
	["P"] = "which_key_ignore", -- special label to hide it in the popup
	["<space>"] = "which_key_ignore", -- special label to hide it in the popup
	["y"] = "which_key_ignore", -- special label to hide it in the popup
	["Y"] = "which_key_ignore", -- special label to hide it in the popup
}, {
	prefix = "<leader>",
})

wk.register({
	s = { '"sy:%s/<C-R>s//g<Left><Left>', "rename all" },
	S = { '"sy:%s/<C-R>s/<C-R>s/g<Left><Left>', "full rename all" },
	-- k = { [[:s/\%V\w\u\+\(_\w\u\+\)\+/\L\0/g<cr>:s/\%V_\(\w\)/\U\1/g<cr>]], "Snake to Camel" },
}, {
	prefix = "<leader>",
	mode = "v",
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
