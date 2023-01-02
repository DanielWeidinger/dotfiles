local state = {
    termsInUse = { 1 },
    latestTerm = 1,
    currentDirection = "float",
}

local utils = require("weidinger.UI.toggleterm.utils")

require("weidinger.UI.toggleterm.keymaps").setup(state)
require("weidinger.UI.toggleterm.special_terms").setup(state)
require("toggleterm").setup({
    start_in_insert = true,
    persist_mode = true,
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.3
        end
    end,
    on_open = function(term)
        state.latestTerm = term.id
        if not vim.tbl_contains(state.termsInUse, term.id) then
            table.insert(state.termsInUse, term.id)
            table.sort(state.termsInUse, function(a, b)
                return a < b
            end)
        end
        vim.cmd("startinsert!")
        if state.currentDirection == "float" and vim.api.nvim_get_mode().mode == "t" then -- Too also start in insert when creating a new term from within terminalmode
            vim.cmd([[call feedkeys("i")]])
        end
    end,
    on_close = function(term) end,
    on_exit = function(term, job, exit_code, name)
        local idx = utils.getIdx(state.termsInUse, term.id)
        if idx then
            if term.id == state.latestTerm then
                local idxToUse = (idx + 1) % (#state.termsInUse + 1)
                state.latestTerm = state.termsInUse[idxToUse == 0 and 1 or idxToUse] -- Reinstate active terminal if latest got cloesed
            end
            table.remove(state.termsInUse, idx)
        end
    end,
    winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
            return "Term: " .. term.id
        end,
    },
})
