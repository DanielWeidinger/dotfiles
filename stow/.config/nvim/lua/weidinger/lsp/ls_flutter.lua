local handlers = require("weidinger.lsp.handlers")
local M = {}

M.setup = function()
    vim.keymap.set(
        "n",
        "<leader>fd",
        "<cmd>lua require('telescope').extensions.flutter.commands()<cr>",
        { desc = "Flutter commands" }
    )

    require("flutter-tools").setup({
        lsp = {
            capabilities = Capabilities,
            enabled = false,
            on_attach = function(client)
                handlers.on_attach_format(client)
                client.server_capabilities.document_formatting = true
            end,
        },
        debugger = { -- integrate with nvim dap + install dart code debugger
            enabled = true,
            run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
            -- register_configurations = function(paths)

            -- end,
        },
        dev_log = {
            enabled = false,
        },
    })
    require("telescope").load_extension("flutter")
end

return M
