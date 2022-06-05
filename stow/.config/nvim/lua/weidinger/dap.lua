local dap, dapui = require("dap"), require("dapui")
dap.defaults.fallback.external_terminal = {
	command = "/usr/bin/alacritty",
	args = { "-e" },
}
-- dap.defaults.fallback.force_external_terminal = true

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("nvim-dap-virtual-text").setup({ enabled = true })

-- python
require("dap-python").setup(vim.g.python3_host_prog)
dap.configurations.python = {} -- Remove default config
table.insert(dap.configurations.python, {
	type = "python",
	request = "launch",
	name = "Launch Module",
	program = "${file}",
	args = { "-m" },
})
-- node
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = {
		vim.fn.stdpath("data") .. "/dapinstall/jsnode_dbg/" .. "/vscode-node-debug2/out/src/nodeDebug.js",
	},
}
dap.configurations.javascript = {
	{
		type = "node2",
		request = "launch",
		program = "${workspaceFolder}/${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}

-- overwrite native nvim dialog to use telescope
require("telescope").load_extension("dap")

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
