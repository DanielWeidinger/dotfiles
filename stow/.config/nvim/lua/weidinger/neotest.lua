require("neotest").setup({
	adapters = {
		require("neotest-jest"),
	},
})

local wk = require("which-key")
wk.register({
	k = {
		name = "Neotest", -- optional group name
		k = { ":lua require('neotest').run.run()<cr>", "Run nearest test" },
		K = { ":lua require('neotest').run.run({strategy = 'dap'})<cr>", "Run nearest test in DAP" },
		a = { ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run all test in file" },
		o = { ":lua require('neotest').output.open()<cr>", "Open Output" },
		s = { ":lua require('neotest').summary.open()<cr>", "Open Summary" },
	},
}, {
	prefix = "<leader>",
})
