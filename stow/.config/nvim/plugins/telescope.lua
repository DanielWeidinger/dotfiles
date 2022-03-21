local telescope = require("telescope")
require("telescope").load_extension("fzy_native")

telescope.setup({})

local wk = require("which-key")
wk.register({
	f = {
		name = "Telescope", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
		F = { "<cmd>Telescope git_files<cr>", "Find non-ignored File" }, -- create a binding with label
		o = { "<cmd>Telescope oldfiles<cr>", "prev. opened" }, -- create a binding with label
		c = { "<cmd>Telescope command_history<cr>", "prev. commands" }, -- create a binding with label
		["&"] = { "<cmd>Telescope colorscheme<cr>", "avaliable colorschemes" }, -- create a binding with label
		g = { "<cmd>Telescope live_grep<cr>", "Grep" }, -- create a binding with label
		b = { "<cmd>Telescope fers<cr>", "Buffers" },
		h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
		t = { "<cmd>TodoTelescope<cr>", "Todos" },
	},
}, {
	prefix = "<leader>",
})
