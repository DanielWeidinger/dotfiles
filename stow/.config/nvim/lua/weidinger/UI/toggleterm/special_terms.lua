local M = {}
M.setup = function(state)
    local on_open = function(term)
        vim.cmd("startinsert!")
        vim.keymap.set({ "n", "t" }, "<F1>", function()
            term:toggle()
        end, { noremap = true, silent = true })
    end
    local on_close = function(term)
        require("weidinger.UI.toggleterm.keymaps").setup(state) -- reinstall keymaps
    end
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
        count = 99,
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        on_open = on_open,
        on_close = on_close,
    })
    local lazydocker = Terminal:new({
        count = 98,
        cmd = "lazydocker",
        hidden = true,
        direction = "float",
        on_open = on_open,
        on_close = on_close,
    })

    local wk = require("which-key")
    wk.register({
        t = {
            name = "Term", -- optional group name
            g = {
                function()
                    lazygit:toggle()
                end,
                "git",
            },
            d = {
                function()
                    lazydocker:toggle()
                end,
                "docker",
            },
            f = {
                function()
                    state.currentDirection = "float"
                end,
                "Mode: Float",
            },
            h = {
                function()
                    state.currentDirection = "horizontal"
                end,
                "Mode: Horizontal",
            },
            v = {
                function()
                    state.currentDirection = "vertical"
                end,
                "Mode: Vertical",
            },
        },
    }, { prefix = "<leader>" })
end
return M
