local handlers = require("weidinger.lsp.handlers")
local lspconfig = require("lspconfig")

local sumneko_root_path = vim.fn.expand("$HOME/.local/share/nvim/lang-servers/lua-language-server/bin")
local sumneko_binary = sumneko_root_path .. "/lua-language-server"

local command = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" }

if vim.g.plugin_dev_mode then
    local luadev = require("lua-dev").setup({
        lspconfig = {
            cmd = command,
            capabilities = Capabilities,
            on_attach = handlers.on_attach_format,
        },
    })
    lspconfig.sumneko_lua.setup(luadev)
else
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    lspconfig.sumneko_lua.setup({
        cmd = command,
        capabilities = Capabilities,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    -- library = vim.api.nvim_get_runtime_file("", true),
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    },
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    })
end
