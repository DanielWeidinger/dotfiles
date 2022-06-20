local wk = require("which-key")

wk.register({
	g = {
		name = "Git", -- optional group name
		s = { ":Git<cr>", "Status" },
		-- c = { ":Git add . | :Git commit -v<cr>", "Add & Commit" },
		-- P = { ":Git -c push.default=current push<CR>", "Push current branch" },
		-- p = {":Git -c pull.default=current pull<CR>", "Pull current branch"},
		b = { ":GBrowse<cr>", "Open in Web" },
	},
}, {
	prefix = "<leader>",
})
