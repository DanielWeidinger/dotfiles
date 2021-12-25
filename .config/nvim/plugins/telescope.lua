local telescope = require("telescope")
require("telescope").load_extension("fzy_native")

telescope.setup({
	extensions = {
		conda = { home = vim.fn.expand("$HOME/miniconda3/envs") },
	},
})

local wk = require("which-key")
wk.register({
	f = {
		name = "Telescope", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
		g = { "<cmd>Telescope live_grep<cr>", "Grep" }, -- create a binding with label
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
		t = { "<cmd>TodoTelescope<cr>", "Todos" },
		c = { "<cmd>lua require'telescope'.extensions.conda.conda{}<cr>", "Conda envs" },
	},
}, {
	prefix = "<leader>",
})
