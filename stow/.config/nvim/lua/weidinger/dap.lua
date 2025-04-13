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
local debuggerPath = vim.fn.stdpath("data") .. "/debugger/vscode-js-debug/dist/src/dapDebugServer.js"
require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        args = { debuggerPath, "${port}" },
    },
}

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
    }
end
-- C++
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
    },
}

-- overwrite native nvim dialog to use telescope
-- require("telescope").load_extension("dap")

-- Define key mappings for DAP Debug group
vim.keymap.set("n", "<leader>dd", ":lua require'dap'.run()<cr>", { desc = "Launch" })
vim.keymap.set("n", "<leader>de", ":lua require'dap'.terminate()<cr>", { desc = "End/Terminate" })
vim.keymap.set("n", "<leader>dl", ":lua require'dap'.step_into()<cr>", { desc = "Into" })
vim.keymap.set("n", "<leader>dj", ":lua require'dap'.step_over()<cr>", { desc = "Over" })
vim.keymap.set("n", "<leader>dk", ":lua require'dap'.step_out()<cr>", { desc = "Out" })
vim.keymap.set("n", "<leader>dh", ":lua require'dap'.step_back()<cr>", { desc = "Back" })
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.run_to_cursor()<cr>", { desc = "ToCursor" })
vim.keymap.set("n", "<leader>do", ":lua require'dapui'.toggle()<cr>", { desc = "Toggle full UI" })
vim.keymap.set("n", "<leader>dO", ":lua require'dapui'.open()<cr>", { desc = "Open full UI" })
vim.keymap.set("n", "<leader>dw", ":Telescope dap list_breakpoints<cr>", { desc = "Open Watches" })
vim.keymap.set("n", "<leader>ds", ":call GotoWindow(1004)<cr>", { desc = "Goto Scopes" })
vim.keymap.set("n", "<leader><leader>", ":lua require'dap'.continue()<cr>", { desc = "Continue" })
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<cr>", { desc = "◯ :Toggle" })

-- Define additional key mappings for DAP Debug group in normal and visual modes
vim.keymap.set(
    { "n", "v" },
    "<leader>dI",
    ":lua require'dap.ui.widgets'.hover()<cr>",
    { desc = "(NATIVE)Eval under cursor" }
)
vim.keymap.set({ "n", "v" }, "<leader>di", ":lua require'dapui'.eval()<cr>", { desc = "(DAPUI)Eval under cursor" })
