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

    -- Leader key mappings for terminal actions
    vim.keymap.set("n", "<leader>tg", function()
        lazygit:toggle()
    end, { desc = "git" })
    vim.keymap.set("n", "<leader>td", function()
        lazydocker:toggle()
    end, { desc = "docker" })
    vim.keymap.set("n", "<leader>tf", function()
        state.currentDirection = "float"
    end, { desc = "Mode: Float" })
    vim.keymap.set("n", "<leader>th", function()
        state.currentDirection = "horizontal"
    end, { desc = "Mode: Horizontal" })
    vim.keymap.set("n", "<leader>tv", function()
        state.currentDirection = "vertical"
    end, { desc = "Mode: Vertical" })
end
return M
