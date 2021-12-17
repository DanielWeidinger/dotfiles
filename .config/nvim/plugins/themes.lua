local wk = require("which-key")
wk.register({
	["&"] = {
		name = "Themes", -- optional group name
		n = { ":colorscheme  nord<cr>", "Nord" },
		d = { ":colorscheme dracula<cr>", "Dracular" },
		g = { ":colorscheme gruvbox<cr>", "Gruvbox" },
	},
}, {
	prefix = "<leader>",
})
