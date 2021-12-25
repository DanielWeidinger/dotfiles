local wk = require("which-key")

local jmpBack = ":call JumpBackIfTerminal()<cr>" --<C-w>r
wk.register({
	r = {
		name = "Run", -- optional group name
		-- neoterm
		f = { ":TREPLSendFile<CR>" .. jmpBack, "file" },
		l = { ":TREPLSendLine<CR>" .. jmpBack, "line" },
		s = { ":TREPLSendSelection<CR>" .. jmpBack, "selection", mode = "v" },
	},
}, {
	prefix = "<leader>",
})
