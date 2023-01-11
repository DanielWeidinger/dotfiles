local M = {}

local utils = require("weidinger.UI.toggleterm.utils")
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local defMappings = { "n", "v", "i", "t" }

M.setup = function(state)
    for i = 1, 4 do
        keymap(defMappings, "<F" .. i .. ">", function()
            utils.toggleTerm(state.currentDirection, i)
        end, opts)
    end
    keymap({ "t" }, "<F5>", function()
        utils.toggleTerm(state.currentDirection, state.latestTerm)
    end, opts)
end
return M
