local dap, dapui = require("dap"), require("dapui")
dap.defaults.fallback.external_terminal = {
    command = "/usr/bin/alacritty",
    args = { "-e" },
}
-- dap.defaults.fallback.force_external_terminal = true

dapui.setup({
    layouts = {
        {
            elements = {
                { id = "watches", size = 0.25 },
                { id = "scopes", size = 0.5 },
                { id = "stacks", size = 0.25 },
                -- { id = "breakpoints", size = 0.25 },
            },
            size = 0.2,
            position = "left",
        },
        {
            elements = { "repl" },
            size = 0.25,
            position = "bottom",
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
    },
})

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
    python = vim.g.python3_host_prog,
})
-- node
require("dap-vscode-js").setup({
    debugger_path = vim.fn.stdpath("data") .. "/debugger/vscode-js-debug",
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
            localRoot = vim.fn.getcwd(),
            remoteRoot = "/usr/src/app",
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
    }
end

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
        r = { ":lua require'dap'.run_to_cursor()<cr>", "ToCursor" },
        o = { ":lua require'dapui'.toggle()<cr>", "Toggle full UI" },
        O = { ":lua require'dapui'.open()<cr>", "Open full UI" },
        w = { ":Telescope dap list_breakpoints<cr>", "Open Watches" },
        s = { ":call GotoWindow(1004)<cr>", "Goto Scopes" },
    },
    ["<leader>"] = { ":lua require'dap'.continue()<cr>", "Continue" },
    b = { ":lua require'dap'.toggle_breakpoint()<cr>", "◯ :Toggle" },
}, {
    prefix = "<leader>",
})

wk.register({
    d = {
        name = "DAP Debug", -- optional group name
        I = { ":lua require'dap.ui.widgets'.hover()<cr>", "(NATIVE)Eval under cursor" },
        i = { ":lua require'dapui'.eval()<cr>", "(DAPUI)Eval under cursor" },
    },
}, {
    prefix = "<leader>",
    mode = { "v", "n" },
})
