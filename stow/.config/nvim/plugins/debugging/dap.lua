local dap, dapui = require("dap"), require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open("tray")
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup({enabled = true})
require('dap-python').setup('/home/daniel/miniconda3/bin/python')

-- dap.set_log_level('DEBUG')

local wk = require("which-key")
wk.register({
	d = {
		name = "DAP Debug", -- optional group name
		d = { ":lua require'dap'.run()<cr>", "Launch" },
		e = { ":lua require'dap'.terminate()<cr>", "End/Terminate" },
		l = { ":lua require'dap'.step_into()<cr>", "Into" },
		j = { ":lua require'dap'.step_over()<cr>", "Over" },
		k = { ":lua require'dap'.step_out()<cr>", "Out" },
		h = { ":lua require'dap'.step_back()<cr>", "Back" },
		-- ["<leader>"] = { ":lua require'dap'.continue()<cr>", "Continue" },
		r = { ":lua require'dap'.run_to_cursor()<cr>", "ToCursor" },
		-- b = { ":lua require'dap'.toggle_breakpoint()<cr>", "◯ :Toggle" },
		i = { ":lua require('dap.ui.widgets').hover()<cr>", "Eval under cursor" },
		o = { ":lua require'dapui'.toggle()<cr>", "Toggle full UI" },
		O = { ":lua require'dapui'.open()<cr>", "Open full UI" },
	},
    ["<leader>"] = { ":lua require'dap'.continue()<cr>", "Continue" },
	b = { ":lua require'dap'.toggle_breakpoint()<cr>", "◯ :Toggle" },
}, {
	prefix = "<leader>",
})
